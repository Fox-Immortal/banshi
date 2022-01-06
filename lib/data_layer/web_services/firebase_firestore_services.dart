import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshi/data_layer/models/color_photo.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/data_layer/models/item_json.dart';
import 'package:panshi/data_layer/models/order_status.dart';
import 'package:provider/provider.dart';


class FirebaseFirestoreServices{
  static List<Item>items=[];
  static List<OrderStatus>orderStatus=[];


  Future<void>getItemsData()async{
     await FirebaseFirestore.instance
         .collection('Item')
         .get()
         .then((QuerySnapshot querySnapshot) {
       for (var doc in querySnapshot.docs) {
         List<String>sizes=[];
         for(int i=0;i<doc['sizes'].length;i++){
           sizes.add(doc['sizes'][i]);
         }
         List<ColorPhoto>colorsPhoto=[];

         for(var element in doc['colorsPhoto']){
           List<String>photos=[];
           for(String photo in element['photos']){
             photos.add(photo);
           }
           colorsPhoto.add(
               ColorPhoto(color: element['color'], photos:photos)
           );
         }

         items.add(
             Item(name: doc['name'],
                 price: doc["price"],
                 mainCat: doc["mainCat"],
                 subCat: doc["subCat"],
                 description: doc["description"],
                 sizes: sizes,
                 id: doc.id,
                 colorsPhotos: colorsPhoto
             )
         );
       }
     });
   }

  Future<void>getOrdersData(context)async{
    orderStatus.clear();
    await FirebaseFirestore.instance
        .collection('Order')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if(doc["orderPersonId"]==Provider.of<UserProvider>(context,listen: false).uid){
          List<ItemX>itemsX=[];
          for (var element in doc["items"]) {
            ItemX tempItemX=ItemX(
              selectedSize: element["selectedSize"],
              selectedColor: element['selectedColor'],
              itemImageUrl: element["itemImageUrl"],
              itemName: element["itemName"]
            );
            itemsX.add(tempItemX);
          }
          OrderStatus tempOrderStatus=OrderStatus(
            type: doc['type'],
            total: doc['total'],
            orderPerson: doc['orderPerson'],
            orderPersonId: doc['orderPersonId'],
            items: itemsX,
          );
          orderStatus.add(tempOrderStatus);
        }
      }
    });
  }
   Map<String,List<ItemDetails>>getItemsForSpecificCat(List<String>subCatNames,String mainCat){
     Map<String,List<Item>>finalItemList={};
     Map<String,List<ItemDetails>>categoriesItem= {};
     for(int i=0;i<subCatNames.length;i++){
       List<Item>tempItem=[];
       for(int j=0;j<items.length;j++){
         if(items[j].subCat==subCatNames[i]&&items[j].mainCat==mainCat){
           tempItem.add(items[j]);
         }
       }
       finalItemList.putIfAbsent(subCatNames[i], () =>tempItem);
     }
     finalItemList.forEach((key, value) {
       List<ItemDetails>tempItemDetails=[];
       for (var element in value) {
         Map<int,List<String>>x={};
         for (var element in element.colorsPhotos) {
           x.putIfAbsent(element.color, () => element.photos);
         }
         tempItemDetails.add(
             ItemDetails(
                 itemDescription: element.description,
                 itemSizes: element.sizes as List<String>,
                 itemIsLove: false,
                 itemPrice: double.parse(element.price),
                 itemName: element.name,
                 uid: element.id,
                 categories: [element.mainCat,element.subCat],
                 itemColorsPhotos: x
             )
         );
         categoriesItem.putIfAbsent(key, () => tempItemDetails);

       }
     });
     return categoriesItem;
   }
}