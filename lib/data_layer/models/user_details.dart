import 'dart:convert';

import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/data_layer/models/order.dart';


UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.isVerify,
    required this.love,
  });
  String uid;
  String name;
  String email;
  String phoneNumber;
  bool isVerify;
  List<String>love;
  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    name: json["name"],
    email: json["email"],
    phoneNumber: json["PhoneNumber"],
    uid:json['uid'],
    isVerify: json['isVerify'],
    love: json['love'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "PhoneNumber": phoneNumber,
  };
}
