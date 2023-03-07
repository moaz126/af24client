// To parse required this JSON data, do
//
//     final topSellersList = topSellersListFromJson(jsonString);

import 'dart:convert';

List<TopSellersList> topSellersListFromJson(String str) => List<TopSellersList>.from(json.decode(str).map((x) => TopSellersList.fromJson(x)));

String topSellersListToJson(List<TopSellersList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopSellersList {
  TopSellersList({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.address,
    required this.contact,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.banner,
  });

  int id;
  int sellerId;
  String name;
  String address;
  String contact;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String banner;

  factory TopSellersList.fromJson(Map<String, dynamic> json) => TopSellersList(
    id: json["id"],
    sellerId: json["seller_id"],
    name: json["name"],
    address: json["address"],
    contact: json["contact"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_id": sellerId,
    "name": name,
    "address": address,
    "contact": contact,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "banner": banner,
  };
}
