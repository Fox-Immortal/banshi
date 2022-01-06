// To parse this JSON data, do
//
//     final colorPhoto = colorPhotoFromJson(jsonString);

import 'dart:convert';

ColorPhoto colorPhotoFromJson(String str) => ColorPhoto.fromJson(json.decode(str));

String colorPhotoToJson(ColorPhoto data) => json.encode(data.toJson());

class ColorPhoto {
  ColorPhoto({
    required this.color,
    required this.photos,
  });

  int color;
  List<String> photos;

  factory ColorPhoto.fromJson(Map<String, dynamic> json) => ColorPhoto(
    color: int.parse(json["color"]),
    photos: List<String>.from(json["photos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "photos": List<dynamic>.from(photos.map((x) => x)),
  };
}
