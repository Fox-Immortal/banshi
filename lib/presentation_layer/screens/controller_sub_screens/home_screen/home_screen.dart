import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/web_services/firebase_firestore_services.dart';
import 'package:panshi/data_layer/web_services/prepered_data/prepered.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/home_screen/show_items_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String>menCat=[];
  List<String>womenCat=[];
  List<String>girlsCat=[];
  List<String>boysCat=[];
  List<String>shoesCat=[];
  List<String>beautyCat=[];

  @override
  void initState() {
    super.initState();
    clearLists();
    setLists();
    _tabController = TabController(length: 6, vsync: this);
  }

  clearLists(){
    menCat.clear();
    womenCat.clear();
    girlsCat.clear();
    boysCat.clear();
    shoesCat.clear();
    beautyCat.clear();
  }
  setLists(){
    PrevData.womenOptionsDetails.forEach((key, value) {
      womenCat.add(key);
    });
    PrevData.womenItems=FirebaseFirestoreServices().getItemsForSpecificCat(womenCat, "Women");
    PrevData.menOptionsDetails.forEach((key, value) {
      menCat.add(key);
    });
    PrevData.menItems=FirebaseFirestoreServices().getItemsForSpecificCat(menCat, "Men");
    PrevData.girlsOptionsDetails.forEach((key, value) {
      girlsCat.add(key);
    });
    PrevData.girlsItems=FirebaseFirestoreServices().getItemsForSpecificCat(girlsCat, "Girls");
    PrevData.boysOptionsDetails.forEach((key, value) {
      boysCat.add(key);
    });
    PrevData.boysItems=FirebaseFirestoreServices().getItemsForSpecificCat(boysCat, "Boys");
    PrevData.shoesOptionsDetails.forEach((key, value) {
      shoesCat.add(key);
    });
    PrevData.shoesItems=FirebaseFirestoreServices().getItemsForSpecificCat(shoesCat, "Shoes");
    PrevData.beautyOptionsDetails.forEach((key, value) {
      beautyCat.add(key);
    });
    PrevData.beautyItems=FirebaseFirestoreServices().getItemsForSpecificCat(beautyCat, "Beauty");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    TextStyle tabTextStyle = TextStyle(
        color: MyColors.myWhite,
        fontSize: height * 0.03,
        fontWeight: FontWeight.w300);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          leading: const SizedBox(),
          backgroundColor: MyColors.myBlack,
          title: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Women",
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Men",
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Girls",
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Boys",
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Beauty",
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Shoes",
                  style: tabTextStyle,
                ),
              )
            ],
            controller: _tabController,
            indicatorColor: MyColors.myOrange,
            indicatorWeight: height * 0.003,
            isScrollable: true,
            unselectedLabelColor: MyColors.myWhite,
            labelColor: MyColors.myOrange,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ShowItemScreen(
              categories:PrevData.womenItems,mainCat: "Women",subCatNames: womenCat,
            ),
            ShowItemScreen(
              categories: PrevData.menItems,mainCat: "Men",subCatNames: menCat,
            ),
            ShowItemScreen(
              categories:PrevData.girlsItems,mainCat: "Girls",subCatNames: girlsCat,
            ),
            ShowItemScreen(
              categories: PrevData.boysItems,mainCat: "Boys",subCatNames: boysCat,
            ),
            ShowItemScreen(
              categories: PrevData.beautyItems,mainCat: "Beauty",subCatNames: beautyCat,
            ),
            ShowItemScreen(
              categories: PrevData.shoesItems,mainCat: "Shoes",subCatNames: shoesCat,
            ),
          ],
        ),
      ),
    );
  }
}
