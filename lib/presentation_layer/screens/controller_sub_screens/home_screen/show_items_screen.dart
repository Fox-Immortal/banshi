import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/models/color_photo.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/data_layer/models/item_json.dart';
import 'package:panshi/presentation_layer/widgets/scroll_item/scroll_item.dart';

class ShowItemScreen extends StatefulWidget {
  final Map<String, List<ItemDetails>> categories;
  final String mainCat;
  final List<String>subCatNames;
  const ShowItemScreen({Key? key, required this.categories, required this.mainCat, required this.subCatNames}) : super(key: key);
  @override
  _ShowItemScreenState createState() => _ShowItemScreenState();
}

class _ShowItemScreenState extends State<ShowItemScreen> {
  bool isLoading=true;
  List<Item>items=[];
  Map<String,List<Item>>finalItemList={};
  Map<String,List<ItemDetails>>categoriesItem= {};

  @override
  void initState() {
    setLoading();
    super.initState();
  }
  setLoading(){
    Future.delayed(const Duration(seconds: 1)).then((value){
      setState(() {
        isLoading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: SingleChildScrollView(
          child:
          isLoading?Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color:  Colors.black,
                  strokeWidth: width*0.01,
                ),
                SizedBox(height: height*0.01,),
                const Text("Loading Data")
              ],
            ),
          ):
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getCategoriesDetails(width, height),
          ),
        ),
      ),
    );
  }

  List<Widget> getCategoriesDetails(double width, double height) {

    List<Widget> widgets = [];
    widgets.add(SizedBox(height: height*0.01,));
    widget.categories.forEach((key, value) {
      widgets.add(
        subCatName(width, height, key),
      );
      widgets.add(
        subCatWidget(width, height, value),
      );
      widgets.add(SizedBox(height: height*0.01,));
    });
    widgets.add(SizedBox(height: height*0.03,));
    return widgets;
  }

  Widget subCatName(double width, double height, String subCatNameString) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.033),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.7,
            child: Text(
              subCatNameString,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: height * 0.029,
                  color: MyColors.myBlack,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            width: width*0.2,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Align(
                  alignment: Alignment.center ,
                  child: Text(
                    "See all",
                     overflow:  TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: MyColors.myBlack,
                        fontSize: height * 0.029,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget subCatWidget(
      double width, double height, List<ItemDetails> itemDetails) {
    return SizedBox(
      child:GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: height * 0.7 / height,
        ),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 4),
        physics: const ClampingScrollPhysics(),
        children:  getContainerPhotos(width, height, itemDetails),
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
