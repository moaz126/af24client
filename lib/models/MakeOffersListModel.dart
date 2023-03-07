// To parse required this JSON data, do
//
//     final makeOffersListModel = makeOffersListModelFromJson(jsonString);

import 'dart:convert';

MakeOffersListModel makeOffersListModelFromJson(String str) => MakeOffersListModel.fromJson(json.decode(str));

String makeOffersListModelToJson(MakeOffersListModel data) => json.encode(data.toJson());

class MakeOffersListModel {
  MakeOffersListModel({
    required this.list,
    required this.latest,
  });

  List<Latest> list;
  Latest? latest;

  factory MakeOffersListModel.fromJson(Map<String, dynamic> json) => MakeOffersListModel(
    list: List<Latest>.from(json["list"].map((x) => Latest.fromJson(x))),
    latest: json["latest"] == null ? null : Latest.fromJson(json["latest"]),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "latest": latest!.toJson(),
  };
}

class Latest {
  Latest({
    required this.id,
    required this.productId,
    required this.userId,
    required this.sellerId,
    required this.quantity,
    required this.price,
    required this.color,
    required this.size,
    required this.priceSetBySeller,
    required this.seenBySeller,
    required this.generatedLink,
    required this.status,
    required this.requestStatus,
    required this.rejectReason,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productId;
  int userId;
  int sellerId;
  int quantity;
  int? price;
  String color;
  String? size;
  int? priceSetBySeller;
  int seenBySeller;
  String? generatedLink;
  int status;
  int requestStatus;
  dynamic rejectReason;
  DateTime createdAt;
  DateTime updatedAt;

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
    id: json["id"],
    productId: json["product_id"],
    userId: json["user_id"],
    sellerId: json["seller_id"],
    quantity: json["quantity"],
    price: json["price"],
    color: json["color"],
    size: json["size"],
    priceSetBySeller: json["price_set_by_seller"] == null ? null : json["price_set_by_seller"],
    seenBySeller: json["seen_by_seller"],
    generatedLink: json["generated_link"] == null ? null : json["generated_link"],
    status: json["status"],
    requestStatus: json["request_status"],
    rejectReason: json["reject_reason"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "user_id": userId,
    "seller_id": sellerId,
    "quantity": quantity,
    "price": price,
    "color": color,
    "size": size,
    "price_set_by_seller": priceSetBySeller == null ? null : priceSetBySeller,
    "seen_by_seller": seenBySeller,
    "generated_link": generatedLink == null ? null : generatedLink,
    "status": status,
    "request_status": requestStatus,
    "reject_reason": rejectReason,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
