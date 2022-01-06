
import 'package:panshi/data_layer/models/item_detailes.dart';

class CartItemDetails{
  ItemDetails itemDetails;
  int selectedColor;
  String selectedSize;
  CartItemDetails({
        required this.itemDetails,
        required this.selectedColor,
        required this.selectedSize
      });


  Map<String, dynamic> toJson() => {
    "selectedColor": selectedColor,
    "selectedSize": selectedSize,
    "itemId":itemDetails.uid
  };
}