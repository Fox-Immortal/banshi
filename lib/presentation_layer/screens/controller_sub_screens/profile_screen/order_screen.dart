import 'package:flutter/material.dart';
import 'package:panshi/data_layer/models/order_status.dart';
import 'package:panshi/data_layer/web_services/firebase_firestore_services.dart';
import 'package:panshi/presentation_layer/widgets/order_widget.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isLoading=true;
  @override
  void initState() {
    getOrderData();
    super.initState();
  }
  getOrderData()async{
    await FirebaseFirestoreServices().getOrdersData(context).then((value) => Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        isLoading=false;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("Your Orders"),
        centerTitle: false,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();},icon: const Icon(Icons.arrow_back,color: Colors.white,),),
      ),
      body: Container(
        margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child:isLoading?Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: width*0.01,
                ),
                const Text("Loading Data"),
              ],
            ),
          ):Column(
            children: getOrders(width,height),
          ),
        ),
      ),
    );
  }

  List<Widget>getOrders(double width,double height){
    List<Widget>orders=[];
     for (OrderStatus element in FirebaseFirestoreServices.orderStatus) {
       orders.add(OrderWidget(width: width, heightX: height,orderStatus:element,));
       orders.add(SizedBox(height: height*0.03,));
     }
    return orders;
  }
}