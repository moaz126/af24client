// To parse this JSON data, do
//
//     final brandList = brandListFromJson(jsonString);

import 'dart:convert';

List<BrandList> brandListFromJson(String str) => List<BrandList>.from(json.decode(str).map((x) => BrandList.fromJson(x)));

String brandListToJson(List<BrandList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandList {
  BrandList({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.brandProductsCount,
    required this.translations,
  });

  int id;
  String name;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int brandProductsCount;
  List<dynamic> translations;

  factory BrandList.fromJson(Map<String, dynamic> json) => BrandList(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    brandProductsCount: json["brand_products_count"],
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "brand_products_count": brandProductsCount,
    "translations": List<dynamic>.from(translations.map((x) => x)),
  };
}
