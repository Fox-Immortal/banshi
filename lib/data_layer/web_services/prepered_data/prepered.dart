import'package:flutter/material.dart';
import 'package:panshi/data_layer/models/item_detailes.dart';
import 'package:panshi/data_layer/models/order.dart';

class PrevData{

  static Map<String, String> menOptionsDetails = {
    "Jackets": "assets/images/menjacket2.jpeg",
    "Sweatshirts": "assets/images/mensweatshirt.jpeg",
    "Tees": "assets/images/mentees3.jpeg",
    "Jeans": "assets/images/menjeans2.jpeg",
    "Pants": "assets/images/menpants2.jpg",
    "Co-ords": "assets/images/menco.jpeg",
    "Swimwear": "assets/images/menswim1.jpeg",
    "Underwear": "assets/images/menunder.jpeg",
    "Shirts": "assets/images/menshirts3.jpeg",
    "Poloshirts": "assets/images/menpolo.jpeg",
    "Socks": "assets/images/mensocks.jpeg",
  };
  static Map<String, String> womenOptionsDetails = {
    "T-shirts": "assets/images/womentshirt.jpeg",
    "Sweatshirts": "assets/images/womensweat.jpeg",
    "Blouses": "assets/images/womenblouse.jpeg",
    "Jackets": "assets/images/womenjackets.jpeg",
    "Hoodies": "assets/images/womenhoodies.jpeg",
    "Pullovers": "assets/images/womnpull.jpeg",
    "Dresses": "assets/images/womendress2.jpeg",
    "Pants": "assets/images/womenpants.jpeg",
    "Jeans": "assets/images/womenjeans.jpeg",
    "Shorts": "assets/images/womenshorts.jpeg",
    "Socks": "assets/images/womensocks.jpeg",
    "Home": "assets/images/womenhome2.jpeg",
  };
  static Map<String, String> boysOptionsDetails = {
    "T-shirts": "assets/images/boytshirt.jpeg",
    "Jackets": "assets/images/boyjacket.jpeg",
    "Knitwear": "assets/images/boykn.jpeg",
    "Shirts": "assets/images/boyshirt.jpeg",
    "Poloshirts": "assets/images/boypolo.jpeg",
    "Pants": "assets/images/boypant.jpeg",
    "Jeans": "assets/images/boyjeans.jpeg",
    "Home": "assets/images/boyhome.jpeg",
    "Swimwear": "assets/images/boyswim.jpeg",
  };
  static Map<String, String> girlsOptionsDetails = {
    "T-shirts": "assets/images/girlblouse.jpeg",
    "Jackets": "assets/images/girljacket.jpeg",
    "Sweatshirts": "assets/images/girlsweat1.jpeg",
    "Blouse": "assets/images/girltshirt.jpeg",
    "Pants": "assets/images/girlpant.jpeg",
    "Jeans": "assets/images/girljeans.jpeg",
    "Home": "assets/images/girlhome.jpeg",
    "Skirts": "assets/images/girlskirt.jpeg",
    "Dresses": "assets/images/girldress1.jpeg",
  };
  static Map<String, String> beautyOptionsDetails = {
    "Face": "assets/images/beautyface.jpeg",
    "Eyes": "assets/images/beautyeye.jpeg",
    "Lips": "assets/images/beautylips.png",
    "Nails": "assets/images/beautynails.jpeg",
    "Skin": "assets/images/beautyskin.jpeg",
    "Hair": "assets/images/beautyhair.jpeg",
    "Accessories": "assets/images/beautyacc.jpeg",
    "Fragrances": "assets/images/beautyfrag.jpeg",
    "MackUp kit": "assets/images/beautykit.jpeg",
    "Beauty Tools": "assets/images/beautytools.jpeg",
  };
  static Map<String, String> shoesOptionsDetails = {
    "Casual": "assets/images/scasual.jpeg",
    "Sport": "assets/images/ssport.jpeg",
    "Boots": "assets/images/sboots.jpeg",
    "Heels": "assets/images/sheels.jpeg",
    "Sandals": "assets/images/ssandals.png",
    "Slipper": "assets/images/sslipper.jpeg",
    "Men Formal": "assets/images/sformal.jpeg",
    "Men Sport": "assets/images/smensport.jpeg",
    "Men Boots": "assets/images/smenboot.jpeg",
  };
  static List<Order>orders=[];
  static Map<String,List<ItemDetails>>menItems={};
  static Map<String,List<ItemDetails>>womenItems={};
  static Map<String,List<ItemDetails>>girlsItems={};
  static Map<String,List<ItemDetails>>boysItems={};
  static Map<String,List<ItemDetails>>shoesItems={};
  static Map<String,List<ItemDetails>>beautyItems={};
}