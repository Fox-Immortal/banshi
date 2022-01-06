import 'package:flutter/material.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/presentation_layer/widgets/scroll_item/scroll_item.dart';


class SubCatScreen extends StatefulWidget {
  final List<ItemDetails>subCatItems;
  final String mainCat;
  final String subCat;
  const SubCatScreen({Key? key,required this.subCatItems,required this.mainCat,required this.subCat}) : super(key: key);
  @override
  _SubCatScreenState createState() => _SubCatScreenState();
}

class _SubCatScreenState extends State<SubCatScreen> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        centerTitle: false,
        title: Text(widget.mainCat+" "+widget.subCat),
      ),
      body: Container(
        margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: height * 0.7 / height,
            ),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 4),
            physics: const ClampingScrollPhysics(),
            children:  getContainerPhotos(width, height, widget.subCatItems),
          ),
        ),
      ),
    );
  }

  List<Widget> getContainerPhotos(
      double width, double height, List<ItemDetails> itemDetails) {
    List<Widget> allContainerPhotos = [];
    for (int i = 0; i < itemDetails.length; i++) {
      allContainerPhotos
          .add(ScrollItem(width: width * 0.45,height:  height * 0.35,itemDetails:itemDetails[i]));
    }
    return allContainerPhotos;
  }
}
