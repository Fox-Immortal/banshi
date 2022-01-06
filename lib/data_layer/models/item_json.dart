// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

import 'package:panshi/data_layer/models/color_photo.dart';


// Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.name,
    required this.price,
    required this.mainCat,
    required this.subCat,
    required this.description,
    required this.sizes,
    required this.colorsPhotos,
    required this.id
  });

  String name;
  String price;
  String mainCat;
  String subCat;
  String description;
  List<dynamic> sizes;
  List<ColorPhoto>colorsPhotos;
  String id;

  // factory Item.fromJson(Map<String, dynamic> json) => Item(
  //   name: json["name"],
  //   price: json["price"],
  //   mainCat: json["mainCat"],
  //   subCat: json["subCat"],
  //   description: json["description"],
  //   sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
  //   colorsPhotos: List<dynamic>.from(json[""])
  // );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "mainCat": mainCat,
    "subCat": subCat,
    "description": description,
    "sizes": List<String>.from(sizes.map((x) => x.toString())),
    "colorsPhoto":List<Map<String,dynamic>>.from(colorsPhotos.map((x) => x.toJson()))
  };
}


