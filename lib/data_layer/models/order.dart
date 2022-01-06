
import 'package:panshi/data_layer/models/cart_item_details.dart';

class Order{
  String orderPerson;
  double total;
  Map<int,CartItemDetails>items;

  Order({required this.orderPerson,required this.total,required this.items});


}


