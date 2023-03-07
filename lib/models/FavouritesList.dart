// To parse required this JSON data, do
//
//     final favouriteSellersList = favouriteSellersListFromJson(jsonString);

import 'dart:convert';


class FavouriteSellersList {
  FavouriteSellersList({
    required this.id,
    required this.seller_id,
    required this.name,
    required this.image,
  });

  int id;
  int seller_id;
  String name;
  String image;

  factory FavouriteSellersList.fromJson(Map<String, dynamic> json) => FavouriteSellersList(
    id: json["id"],
    seller_id: json["seller_id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_id": seller_id,
    "name": name,
    "image": image,
  };
}
