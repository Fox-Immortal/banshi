import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/home_screen/show_item_details_screen.dart';



class ScrollItem extends StatelessWidget {
  final ItemDetails itemDetails;
  final double width,height;
  const ScrollItem({Key? key,required this.itemDetails,required this.width,required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String photo = "";
    itemDetails.itemColorsPhotos.forEach((key, value) {
        photo = value[0];
    });
    return FittedBox(
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: width,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ShowItemDetailsScreen(itemDetails: itemDetails)));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  primary: MyColors.myWhite,
                  elevation: 2,
                  shadowColor: MyColors.myBlack,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
              child: Stack(children: [
                Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //   color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage(photo), fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: height * 0.024,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        itemDetails.itemName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: MyColors.myBlack, fontSize: height * 0.065),
                      ),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        itemDetails.itemDescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: MyColors.myGray, fontSize: height * 0.065),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.02,
                        bottom:  height * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: width * 0.55,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: getColorsContainer(
                                      width, height, itemDetails)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.black,
                            ),
                            width: width * 0.35,
                            padding: EdgeInsets.symmetric(vertical: height * 0.01),
                            alignment: Alignment.center,
                            child: Text(
                              "${itemDetails.itemPrice}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  color: MyColors.myOrange,
                                  fontSize: height * 0.07),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // Positioned(
                //   top: height * 0.54,
                //   left: width * 0.75,
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: CircleAvatar(
                //       backgroundColor: Colors.black,
                //       radius: 17,
                //       child: FittedBox(
                //         child: IconButton(
                //           onPressed: () {},
                //           icon: Icon(
                //             itemDetails.itemIsLove
                //                 ? Icons.favorite_border
                //                 : Icons.favorite,
                //             color: MyColors.myOrange,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ])),
        ));
  }



  List<Widget> getColorsContainer(
      double width, double height, ItemDetails itemDetails) {
    List<Widget> colorsWidget = [];
    int i = 0;
    itemDetails.itemColorsPhotos.forEach((key, value) {
      if (i < 4) {
        i++;
        colorsWidget.add(Container(
          decoration: BoxDecoration(
              color: Color(key),
              borderRadius: BorderRadius.circular(10)
          ),
          margin: EdgeInsets.only(left: width * 0.01),
          width: width * 0.12,
          height: height * 0.07,
        ));
      }
    });
    return colorsWidget;
  }


}
