import 'package:flutter/material.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/cart_provider.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/models/cart_item_details.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/data_layer/web_services/prepered_data/prepered.dart';
import 'package:panshi/presentation_layer/screens/controller_screens/cart_screen.dart';
import 'package:panshi/presentation_layer/widgets/show_item_details_screen_widgets/page_slider.dart';
import 'package:provider/provider.dart';

class ShowItemDetailsScreen extends StatefulWidget {
  final ItemDetails itemDetails;
  const ShowItemDetailsScreen({Key? key, required this.itemDetails})
      : super(key: key);

  @override
  _ShowItemDetailsScreenState createState() => _ShowItemDetailsScreenState();
}

class _ShowItemDetailsScreenState extends State<ShowItemDetailsScreen> {
  Map<int, List<String>> colorsPhoto = {};
  List<bool> selectedColor = [];
  List<bool> selectedSize = [];
  int selectedColorIndex=0;
  int mainSelectedColor=0;
  Color mainColor = MyColors.myBlack;
  List<String> futurePhoto = [];
  List<String> filterPhotos=[];
  String size = "";
  @override
  void initState() {
    int i=0;
    widget.itemDetails.itemColorsPhotos.forEach((key, value) {
      if(i==0){
        setState(() {
          mainSelectedColor=key;
        });
      }
      i++;
    });
    setState(() {
      selectedColor.clear();
      selectedSize.clear();
      futurePhoto.clear();
      filterPhotos.clear();
    });
    for(int i=0;i<widget.itemDetails.itemColorsPhotos.length;i++){
      if(i==0){
       setState(() {
         selectedColor.add(true);
       });
      }else{
        setState(() {
          selectedColor.add(false);
        });
      }
    }
    for(int i=0;i<widget.itemDetails.itemSizes.length;i++){
      if(i==0){
        setState(() {
          selectedSize.add(true);
        });
      }else{
        setState(() {
          selectedSize.add(false);
        });
      }
    }
    initial();
    super.initState();
  }
  int getSelectedColor(){
    int color=0;
    for(int i=0;i<selectedColor.length;i++){
      if(selectedColor[i]){
        color=i;
        break;
      }
    }
    return color;
  }


  String getSelectedSize(){
    int size=0;
    for(int i=0;i<selectedSize.length;i++){
      if(selectedSize[i]){
        size=i;
        break;
      }
    }
    return widget.itemDetails.itemSizes[size];
  }



  void initial() async {
    setState(() {
      filterPhotos.clear();
      futurePhoto.clear();
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      getPhotos();
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.065,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.itemDetails.itemName,
          style: const TextStyle(color: MyColors.myBlack),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: height * 0.03,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              widget.itemDetails.itemIsLove
                  ? Icons.favorite_border
                  : Icons.favorite,
              color: MyColors.myBlack,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>const CartScreen()));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: MyColors.myBlack,
                size: height * 0.03,
              )),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          int index=0;
          if(Provider.of<CartItemsProvider>(context,listen: false).cartItems.containsKey(
              Provider.of<CartItemsProvider>(context,listen: false).cartItems.length+1
          )){
           setState(() {
             Provider.of<CartItemsProvider>(context,listen: false).cartItems.putIfAbsent(
                 Provider.of<CartItemsProvider>(context,listen: false).cartItems.length+2, () => CartItemDetails(itemDetails: widget.itemDetails, selectedColor: mainSelectedColor, selectedSize: getSelectedSize()));
           });
          }else{
            setState(() {
              Provider.of<CartItemsProvider>(context,listen: false).cartItems.putIfAbsent(
                  (Provider.of<CartItemsProvider>(context,listen: false).cartItems.length)+1, () => CartItemDetails(itemDetails: widget.itemDetails, selectedColor: mainSelectedColor, selectedSize: getSelectedSize()));
            });
          }
          setState(() {
            Provider.of<CartItemsProvider>(context,listen: false).total=
                Provider.of<CartItemsProvider>(context,listen: false).total+widget.itemDetails.itemPrice;
          });
          Navigator.push(context,MaterialPageRoute(builder:(context)=>const CartScreen()));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          alignment: Alignment.center,
          width: width,
          height: height * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        child: Text(
                      "${widget.itemDetails.itemPrice} JD",
                      style: TextStyle(
                          color: MyColors.myOrange, fontSize: height * 0.03),
                    )),
                    SizedBox(
                        child: Text(
                      "Add to cart",
                      style: TextStyle(
                          color: MyColors.myOrange, fontSize: height * 0.03),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          futurePhoto.isNotEmpty
              ? PagesSlider(
                  width: width,
                  height: height,
                  color: Colors.black,
                  photo: futurePhoto,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.5,
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            MyColors.myOrange),
                        strokeWidth: MediaQuery.of(context).size.width * 0.01,
                      )),
                    ),
                  ],
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildRowText(
                  fw: FontWeight.w400,
                  fontSize: height * 0.03,
                  height: height,
                  width: width,
                  color: MyColors.myBlack,
                  text: "Name"),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.itemDetails.itemName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: MyColors.myGray, fontSize: height * 0.025),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildRowText(
                        fw: FontWeight.w400,
                        fontSize: height * 0.03,
                        height: height,
                        width: width,
                        color: MyColors.myBlack,
                        text: "Description"),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.itemDetails.itemDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: MyColors.myGray, fontSize: height * 0.025),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      width: width * 0.02,
                      color: MyColors.myGray.withOpacity(0.1)),
                )),
                height: height * 0.002,
              ),


              buildRowText(
                  fw: FontWeight.w400,
                  color: Colors.black,
                  height: height,
                  width: width,
                  text: "Colors",
                  fontSize: height * 0.03),
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.022,
                    top: height * 0.005),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: getColorWidget(width, height)),
                    ),
                  ),
                ),
              ),


              Visibility(
                  visible: widget.itemDetails.itemSizes.isEmpty ? false : true,
                  child: buildRowText(
                      fw: FontWeight.w400,
                      color: Colors.black,
                      height: height,
                      width: width,
                      text: "Sizes",
                      fontSize: height * 0.03)),
              SizedBox(
                child: SizedBox(
                  width: width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: getSizesWidget(width, height)),
                      ),
                    ),
                  ),
                ),
              ),



              buildRowText(
                  fw: FontWeight.w400,
                  color: Colors.black,
                  height: height,
                  width: width,
                  text: "Category",
                  fontSize: height * 0.03),
              Container(
                height: height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.022,
                    top: height * 0.005),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: getCatWidget(width, height)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      width: width * 0.02,
                      color: MyColors.myGray.withOpacity(0.1)),
                )),
                height: height * 0.001,
              ),

              buildRowText(
                  fw: FontWeight.w400,
                  color: Colors.black,
                  height: height,
                  width: width,
                  text: "Related",
                  fontSize: height * 0.03),
              SizedBox(height: height*0.02,),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: height * 0.8 / height,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: getRelatedWidget(width, height),
              ),
              SizedBox(height: height * 0.03)
            ],
          ),
        ],
      ),
    );
  }

  Widget colorWidget(double width, double height, Color color,int index) {
    return InkWell(
      onTap: () {
        for(int i=0;i<selectedColor.length;i++){
          if(i==index){
             setState(() {
               mainSelectedColor=color.value;
               selectedColorIndex=i;
               selectedColor[i]=true;
             });
          }else{
            setState(() {
              selectedColor[i]=false;
            });
          }
        }
        setState(() {
          initial();
        });
        },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          border: Border.all(color:selectedColor[index]? MyColors.myOrange:MyColors.myBlack, width: width * 0.02),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          width: width * 0.9,
          height: height * 0.9,
        ),
      ),
    );
  }

  Widget sizeWidget(double width, double height, String itemSize,int index) {
    return InkWell(
      onTap: () {
        for(int i=0;i<selectedSize.length;i++){
          if(i==index){
            setState(() {
              setState(() {
                selectedSize[i]=true;
              });
            });
          }else{
           setState(() {
             selectedSize[i]=false;
           });
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:selectedSize[index]? MyColors.myOrange:MyColors.myBlack, width: width * 0.01),
        ),
        child: SizedBox(
          width: width * 0.9,
          height: height * 0.9,
          child: Center(
            child: Text(
              itemSize,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget catWidget(double width, double height, String itemSize) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: MyColors.myBlack, width: width * 0.01),
        ),
        child: SizedBox(
          height: height * 0.9,
          child: Center(
            child: Text(
              itemSize,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget relatedWidget(double width, double height, ItemDetails itemDetails) {
    String mainPhoto = "";
    itemDetails.itemColorsPhotos.forEach((key, value) {
      int i = 0;
      for (String element in value) {
        if (i == 0) {
          setState(() {
            i++;
            mainPhoto = element;
          });
        }
      }
    });
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ShowItemDetailsScreen(itemDetails: itemDetails)));
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            primary: MyColors.myWhite),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: height * 0.03),
              height: height * 0.85,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.zero,
                image: DecorationImage(
                    image: NetworkImage(mainPhoto), fit: BoxFit.cover),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "JD ${itemDetails.itemPrice} \$",
                  style: TextStyle(
                      color: MyColors.myBlack, fontSize: height * 0.07),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildRowText(
      {required FontWeight fw,
      required double fontSize,
      required double height,
      required double width,
      required Color color,
      required String text}) {
    return Container(
      height: height * 0.03,
      width: width,
      margin: EdgeInsets.only(left: width * 0.025, top: height * 0.02),
      child: Text(
        text,
        style: TextStyle(fontWeight: fw, color: color, fontSize: fontSize),
      ),
    );
  }

  List<Widget> getColorWidget(double width, double height) {
    List<Widget> colorWidgets = [];
    int i=0;
    colorsPhoto.forEach((key, value) {
      colorWidgets.add(colorWidget(width * 0.1, height * 0.05, Color(key),i));
      i++;
    });
    return colorWidgets;
  }

  List<Widget> getSizesWidget(double width, double height) {
    List<Widget> sizedWidgets = [];
    int i=0;
    for (var element in widget.itemDetails.itemSizes) {
      sizedWidgets.add(sizeWidget(width * 0.2, height * 0.04, element,i));
      i++;
    }
    return sizedWidgets;
  }

  List<Widget> getCatWidget(double width, double height) {
    List<Widget> catWidgets = [];
    for (var element in widget.itemDetails.categories) {
      catWidgets.add(catWidget(width * 0.15, height * 0.05, element));
    }
    return catWidgets;
  }

  List<Widget> getRelatedWidget(double width, double height) {
    List<Widget> relatedWidgets = [];
    Map<String, List<ItemDetails>> bufferMap = {};
    if (widget.itemDetails.categories[0] == "Women") {
      setState(() {
        bufferMap = PrevData.womenItems;
      });
    } else if (widget.itemDetails.categories[0] == "Men") {
      setState(() {
        bufferMap = PrevData.menItems;
      });
    } else if (widget.itemDetails.categories[0] == "Girls") {
      setState(() {
        bufferMap = PrevData.girlsItems;
      });
    } else if (widget.itemDetails.categories[0] == "Boys") {
      setState(() {
        bufferMap = PrevData.boysItems;
      });
    } else if (widget.itemDetails.categories[0] == "Beauty") {
      setState(() {
        bufferMap = PrevData.beautyItems;
      });
    } else if (widget.itemDetails.categories[0] == "Shoes") {
      setState(() {
        bufferMap = PrevData.shoesItems;
      });
    }
    bufferMap.forEach((key, value) {
      for (ItemDetails element in value) {
        relatedWidgets.add(relatedWidget(width * 0.4, height * 0.3, element));
      }
    });
    return relatedWidgets;
  }

  void getPhotos() {
    int i = 0;

    widget.itemDetails.itemColorsPhotos.forEach((key, value) {
      if (i == selectedColorIndex) {
        setState(() {
          mainColor = Color(key);
        });
      }
      setState(() {
        colorsPhoto.putIfAbsent(key, () => value);
        if (i == selectedColorIndex) {
          for (String element in value) {
            setState(() {
              futurePhoto.add(element);
            });
          }
        }
        i++;
      });
    });
  }
}
