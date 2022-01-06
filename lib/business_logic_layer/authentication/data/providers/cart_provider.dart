


import 'package:flutter/cupertino.dart';
import 'package:panshi/data_layer/models/cart_item_details.dart';

class CartItemsProvider extends ChangeNotifier{
  Map<int,CartItemDetails>cartItems;
  double total;
  int length;

  CartItemsProvider({required this.cartItems,required this.total,required this.length});
}