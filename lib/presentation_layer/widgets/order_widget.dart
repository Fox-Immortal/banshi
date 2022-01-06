import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/models/cart_item_details.dart';
import 'package:panshi/data_layer/models/order.dart';
import 'package:panshi/data_layer/models/order_status.dart';

class OrderWidget extends StatelessWidget {
  final double width;
  final double heightX;
  final OrderStatus orderStatus;
  const OrderWidget({Key? key,required this.width,required this.heightX,required this.orderStatus,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height=heightX*0.25;
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          padding: EdgeInsets.zero
      ),
      child: SizedBox(
        // margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration:const BoxDecoration(
                color: Color(0xffdf861d),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)
                ),
              ),
              padding:const EdgeInsets.symmetric(horizontal: 10),
              height: height*0.22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Person :",
                    style: TextStyle(
                        fontSize: height*0.1,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: width*0.03,),
                  Text(
                    orderStatus.orderPerson as String,
                    style: TextStyle(
                        fontSize: height*0.1,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey,width: height*0.003),
                    bottom: BorderSide(color: Colors.grey,width: height*0.003),
                  )
              ),
              padding:const EdgeInsets.symmetric(horizontal: 10),
              height: height*0.22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Total :",
                    style: TextStyle(
                        fontSize: height*0.1,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: width*0.03,),
                  Text(
                    "\$${orderStatus.total} JD",
                    style: TextStyle(
                        fontSize: height*0.1,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),

            ),
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:getOrderItems(width,height,orderStatus),
              ),
            ),
            SizedBox(height: height*0.05,),
            Container(
              height: height*0.22,
              padding:const EdgeInsets.symmetric(horizontal: 10),
              decoration:const BoxDecoration(
                color:Color(0xffdf861d),
                borderRadius: BorderRadius.only(
                    bottomRight:Radius.circular(10),
                    bottomLeft:  Radius.circular(10)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Status :",
                    style: TextStyle(
                        fontSize: height*0.1,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: width*0.03,),
                  Text(
                    orderStatus.type as String,
                    style: TextStyle(
                        fontSize: height*0.1,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
  List<Widget> getOrderItems(double width,double height,OrderStatus orderStatus){
    List<Widget>orderItems=[];
    orderStatus.items?.forEach((element) {
      orderItems.add(
          orderItem(width,height,element)
      );
    });
    return orderItems;
  }

  Widget orderItem(double width,double height,ItemX itemX){


    return SizedBox(
      width: width,
      height: height*0.22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "1 x",
            style: TextStyle(
                fontSize: height*0.1,
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(width: width*0.03,),
          CircleAvatar(
              backgroundColor: Colors.yellow,
              radius: 15,
              backgroundImage:NetworkImage(itemX.itemImageUrl as String)
          ),
          SizedBox(width: width*0.03,),
          Text(
            itemX.itemName as String,
            style: TextStyle(
                fontSize: height*0.1,
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }

}
