import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/data_layer/web_services/prepered_data/prepered.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/category_screen/sub_cat_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int whichCat=1;
  List<Color> sideCatMenuOptionColors = [
    Colors.grey.shade200,
    MyColors.myWhite,
    MyColors.myWhite,
    MyColors.myWhite,
    MyColors.myWhite,
    MyColors.myWhite,
  ];


  @override
  void initState() {
    setState(() {
      whichCat=1;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: sideCatMenu(width, height),
          ),
          Expanded(flex: 3, child: gridOfMenuOption(width, height,whichCat)),
        ],
      ),
    );
  }

  Widget sideCatMenu(double width, double height) {
    return Container(
      color: MyColors.myWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          sideCatMenuOption(
              width, height, "Men", 0, sideCatMenuOptionColors[0]),
          sideCatMenuOption(
              width, height, "Women", 1, sideCatMenuOptionColors[1]),
          sideCatMenuOption(
              width, height, "Boys", 2, sideCatMenuOptionColors[2]),
          sideCatMenuOption(
              width, height, "Girls", 3, sideCatMenuOptionColors[3]),
        sideCatMenuOption(
              width, height, "Beauty", 4, sideCatMenuOptionColors[4]),
          sideCatMenuOption(
              width, height, "Shoes", 5, sideCatMenuOptionColors[5]),
        ],
      ),
    );
  }

  Widget sideCatMenuOption(
      double width, double height, String catName, int index, Color color) {
    return SizedBox(
        width: double.infinity,
        height: height * 0.08,
        child: ElevatedButton(
          onPressed: () {
            for (int i = 0; i < 6; i++) {
              if (i == index) {
                setState(() {
                  sideCatMenuOptionColors[index] = Colors.grey.shade200;
                   whichCat=i+1;
                });
              } else {
                setState(() {
                  sideCatMenuOptionColors[i] = MyColors.myWhite;
                });
              }
            }
          },
          style: ElevatedButton.styleFrom(
              primary: color,
              onPrimary: MyColors.myBlack,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero)),
          child: Align(alignment: Alignment.centerLeft, child: Text(catName)),
        ));
  }

  Widget gridOfMenuOption(double width, double height,int whichCat) {
    return Container(
      color: MyColors.myWhite,
      // padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: height * 0.9 / height,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: catOptions(width, height,whichCat),
          ),
        ],
      ),
    );
  }

  List<Widget> catOptions(double width, double height,int whichCatSet) {
    List<Widget> catOptionList = [];
    Map<String,String>containerList=whichCatSet==1?PrevData.menOptionsDetails:whichCatSet==2?PrevData.womenOptionsDetails
    :whichCatSet==3?PrevData.boysOptionsDetails:whichCatSet==4?PrevData.girlsOptionsDetails:whichCatSet==5?PrevData.beautyOptionsDetails:PrevData.shoesOptionsDetails;
    containerList.forEach((key, value) {
      catOptionList.add(catOptionsItem(width, height, key, value,whichCatSet));
    });

    return catOptionList;
  }

  Widget catOptionsItem(
      double width, double height, String supOptionName, supOptionPhoto,int whichCatSet) {
    return Container(
      color: Colors.white,
      child: ElevatedButton(
        onPressed: () {
          Map<String,List<ItemDetails>>subCatsItem={};
          String mainCat="";
          if(whichCatSet==1){
            subCatsItem=PrevData.menItems;
            mainCat="Men";
          }else if(whichCatSet==2){
            subCatsItem=PrevData.womenItems;
            mainCat="Women";
          }else if(whichCatSet==3){
            subCatsItem=PrevData.boysItems;
            mainCat="Boys";
          }else if(whichCatSet==4){
            subCatsItem=PrevData.girlsItems;
            mainCat="Girls";
          }else if(whichCatSet==5){
            subCatsItem=PrevData.beautyItems;
            mainCat="Beauty";
          }else {
            subCatsItem=PrevData.shoesItems;
            mainCat="Shoes";
          }
          List<ItemDetails>subCatItems=[];
          subCatsItem.forEach((key, value) {
            if(key==supOptionName){
              subCatItems=value;
            }
          });
          Navigator.push(context,MaterialPageRoute(builder:(context)=>SubCatScreen(subCatItems: subCatItems, mainCat: mainCat, subCat: supOptionName)));
        },
        style: ElevatedButton.styleFrom(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            primary: MyColors.myWhite,
            onPrimary: MyColors.myBlack,
            elevation: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.07,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(supOptionPhoto),
              ),
                color: Colors.white,
              ),
            ),
            Text(
              supOptionName,
              style: TextStyle(
                  fontSize: height * 0.015, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
