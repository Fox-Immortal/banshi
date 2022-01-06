import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/cart_provider.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/models/cart_item_details.dart';
import 'package:panshi/data_layer/models/order.dart';
import 'package:panshi/data_layer/models/order_status.dart';
import 'package:panshi/data_layer/web_services/prepered_data/prepered.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/home_screen/show_item_details_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Widget> cartItemWidgets = [];
  @override
  void initState() {
    cartItemWidgets.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myBlack,
        elevation: 0,
        centerTitle: true,
        title: const Text("Cart"),
        leading: Builder(
          builder: (context) => IconButton(
            splashColor:MyColors.myOrange,
            splashRadius: height * 0.03,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: MyColors.myWhite,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                "${Provider.of<CartItemsProvider>(context,listen: false).total}",
                style: TextStyle(fontSize: height * 0.025),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.07,
        width: width,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.08),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () async{
              // OrderStatus tempOrder=OrderStatus(
              // orderPersonId:Provider.of<UserProvider>(context,listen: false).uid
              // ,orderPerson: Provider.of<UserProvider>(context,listen: false).name as String, total:  Provider.of<CartItemsProvider>(context,listen: false).total,
              //  items: Provider.of<CartItemsProvider>(context,listen: false).cartItems
              // );
            List<ItemX>items=[];
            Provider.of<CartItemsProvider>(context,listen: false).cartItems.forEach((key, value) {
              String photoUrl="";
              value.itemDetails.itemColorsPhotos.forEach((key, value1) {
                if(key==value.selectedColor){
                  photoUrl=value1[0];
                }
              });
              ItemX tempItem=ItemX(
                selectedColor: value.selectedColor,
                selectedSize: value.selectedSize,
                itemName: value.itemDetails.itemName,
                itemImageUrl: photoUrl
              );
              items.add(tempItem);
            });
            OrderStatus one=OrderStatus(
              total: Provider.of<CartItemsProvider>(context,listen: false).total,
              orderPerson:Provider.of<UserProvider>(context,listen: false).name as String,
              orderPersonId:Provider.of<UserProvider>(context,listen: false).uid,
              items: items,
              type: "pending"
            );
              CollectionReference addOrder = FirebaseFirestore.instance.collection("Order");
              await addOrder.add(one.toJson()).then((value){
                Navigator.of(context).pop();
              });

              setState(() {
                Provider.of<CartItemsProvider>(context,listen: false).cartItems={};
                Provider.of<CartItemsProvider>(context,listen: false).total=0;
                Provider.of<CartItemsProvider>(context,listen: false).length=0;
              });
          },
          style: ElevatedButton.styleFrom(
              primary: MyColors.myBlack, onPrimary: MyColors.myWhite),
          child: Center(
              child: Text(
            "Confirm",
            style: TextStyle(fontSize: height * 0.03),
          )),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: getCartItems(width, height),
          ),
        ),
      ),
    );
  }

  List<Widget> getCartItems(double width, double height) {
    Map<int,CartItemDetails>cartItemDetails={};

    Provider.of<CartItemsProvider>(context,listen: false).cartItems.forEach((key, value) {
      setState(() {
        cartItemDetails.putIfAbsent(key, () => value);
      });
    });

    cartItemDetails.forEach((key, value) {
     setState(() {
       cartItemWidgets.add(cartItem(width, height*0.15, key,value));
     });
    });

    return cartItemWidgets;
  }

  Widget cartItem(double width, double height, int index,CartItemDetails itemDetails) {
    String photo = "";
    itemDetails.itemDetails.itemColorsPhotos.forEach((key, value) {
      photo = value[0];
    });
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.2),
      width: width,
      height: height,
      child: FittedBox(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>ShowItemDetailsScreen(itemDetails: itemDetails.itemDetails)));
          },
          style: ElevatedButton.styleFrom(
              elevation: 10,
              primary: MyColors.myWhite,
              padding: EdgeInsets.zero),
          child: Row(
            children: [
              Container(
                margin:
                    EdgeInsets.only(right: width * 0.03, left: width * 0.03),
                width: width * 0.2,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(photo),
                  ),
                ),
              ),
              FittedBox(
                child: SizedBox(
                  width: width * 0.65,
                  height: height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.09,
                      ),
                      FittedBox(
                        child: SizedBox(
                          width: width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                itemDetails.itemDetails.itemName,
                                style: TextStyle(
                                    fontSize: height * 0.15,
                                    color: MyColors.myBlack),
                              ),
                              Text(
                                "${itemDetails.itemDetails.itemPrice}",
                                style: TextStyle(
                                    fontSize: height * 0.15,
                                    color: MyColors.myBlack),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      FittedBox(
                        child: SizedBox(
                          height: height * 0.3,
                          // color: Colors.red,
                          width: width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              columnText(width * 0.2, height * 0.5, "Size", itemDetails.selectedSize,
                                  0,height * 0.15,Alignment.centerLeft),
                              columnText(width * 0.2, height * 0.5, "Color",
                                  "red",itemDetails.selectedColor, height * 0.15, Alignment.center),
                              columnText(width * 0.2, height * 0.5, "Count",
                                  "1",0, height * 0.15, Alignment.centerRight),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      FittedBox(
                        child: SizedBox(
                            height: height * 0.3,
                            width: width * 0.6,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Provider.of<CartItemsProvider>(context,listen: false).total-=itemDetails.itemDetails.itemPrice;
                                  Provider.of<CartItemsProvider>(context,listen: false).length-=1;
                                  Provider.of<CartItemsProvider>(context,listen: false).cartItems.remove(index);
                                });
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const CartScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: MyColors.myBlack,
                                  onPrimary: MyColors.myWhite),
                              child: const Center(child: Text("Remove")),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget columnText(double width, double height, String mainText,
      String secondText,int color,double fontSize, Alignment alignment) {
    return Container(
      alignment: alignment,
      // color: Colors.green,
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mainText,
            style: TextStyle(fontSize: fontSize, color: MyColors.myGray),
          ),
          mainText=="Color"?
              Container(
                width: width*0.17,
                height: height*0.22,
                color: Color(color),
              ): Text(
            secondText,
            style: TextStyle(fontSize: fontSize, color: MyColors.myBlack),
          )
        ],
      ),
    );
  }
}
