// To parse this JSON data, do
//
//     final orderStatus = orderStatusFromJson(jsonString);

import 'dart:convert';

OrderStatus orderStatusFromJson(String str) => OrderStatus.fromJson(json.decode(str));

String orderStatusToJson(OrderStatus data) => json.encode(data.toJson());

class OrderStatus {
  OrderStatus({
    this.orderPerson,
    this.orderPersonId,
    this.total,
    this.items,
    this.type,
  });

  String ?orderPerson;
  String ?orderPersonId;
  double ?total;
  String ?type;
  List<ItemX> ?items;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    orderPerson: json["orderPerson"],
    orderPersonId: json["orderPersonId"],
    total: json["total"].toDouble(),
    type:json["type"],
    items: List<ItemX>.from(json["items"].map((x) => ItemX.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderPerson": orderPerson,
    "orderPersonId": orderPersonId,
    "total": total,
    "type":type,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class ItemX {
  ItemX({
    this.selectedColor,
    this.selectedSize,
    this.itemImageUrl,
    this.itemName
  });

  int ?selectedColor;
  String ?selectedSize;
  String ?itemImageUrl;
  String ?itemName;

  factory ItemX.fromJson(Map<String, dynamic> json) => ItemX(
    selectedColor: json["selectedColor"],
    selectedSize: json["selectedSize"],
    itemImageUrl: json["itemImageUrl"],
    itemName: json["itemName"]
  );

  Map<String, dynamic> toJson() => {
    "selectedColor": selectedColor,
    "selectedSize": selectedSize,
    "itemImageUrl": itemImageUrl,
    "itemName":itemName
  };
}
