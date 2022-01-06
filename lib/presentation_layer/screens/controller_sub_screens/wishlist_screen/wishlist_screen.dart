import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/data_layer/web_services/prepered_data/prepered.dart';
import 'package:panshi/presentation_layer/widgets/scroll_item/scroll_item.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return const Scaffold(
      backgroundColor: MyColors.myWhite,
      body: SizedBox(
        child: Center(
          child: Text("There is nothing to show"),
        ),
        // child:GridView(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: height * 0.65 / height,
        //   ),
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.symmetric(vertical: 4),
        //   physics: const ClampingScrollPhysics(),
        //   children:  getScrollItem(width, height),
        // ),
      )
    );
  }

  // List<Widget>getScrollItem(double width,double height){
  //   List<Widget>scrollItems=[];
  //    PrevData.womenDetailsCategories.forEach((key, value) {
  //      for (ItemDetails element in value) {
  //        if(!element.itemIsLove){
  //          setState(() {
  //            scrollItems.add(ScrollItem(itemDetails: element, width: width*0.45, height: height*0.35));
  //          });
  //        }
  //      }});
  //   PrevData.menDetailsCategories.forEach((key, value) {
  //     for (ItemDetails element in value) {
  //       if(!element.itemIsLove){
  //         setState(() {
  //           scrollItems.add(ScrollItem(itemDetails: element, width: width*0.45, height: height*0.35));
  //         });
  //       }
  //     }});
  //   PrevData.girlsDetailsCategories.forEach((key, value) {
  //     for (ItemDetails element in value) {
  //       if(!element.itemIsLove){
  //         setState(() {
  //           scrollItems.add(ScrollItem(itemDetails: element, width: width*0.45, height: height*0.35));
  //         });
  //       }
  //     }});
  //   PrevData.boysDetailsCategories.forEach((key, value) {
  //     for (ItemDetails element in value) {
  //       if(!element.itemIsLove){
  //         setState(() {
  //           scrollItems.add(ScrollItem(itemDetails: element, width: width*0.45, height: height*0.35));
  //         });
  //       }
  //     }});
  //   PrevData.shoesDetailsCategories.forEach((key, value) {
  //     for (ItemDetails element in value) {
  //       if(!element.itemIsLove){
  //         setState(() {
  //           scrollItems.add(ScrollItem(itemDetails: element, width: width*0.45, height: height*0.35));
  //         });
  //       }
  //     }});
  //   PrevData.beautyDetailsCategories.forEach((key, value) {
  //     for (ItemDetails element in value) {
  //       if(!element.itemIsLove){
  //         setState(() {
  //           scrollItems.add(ScrollItem(itemDetails: element, width: width*0.45, height: height*0.35));
  //         });
  //       }
  //     }});
  //   return scrollItems;
  // }
}
