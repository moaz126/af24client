// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    required this.id,
    required this.customerId,
    required this.cartGroupId,
    required this.productId,
    required this.color,
    required this.choices,
    required this.variations,
    required this.variant,
    required this.quantity,
    required this.price,
    required this.tax,
    required this.discount,
    required this.slug,
    required this.name,
    required this.thumbnail,
    required this.sellerId,
    required this.sellerIs,
    required this.createdAt,
    required this.updatedAt,
    required this.shopInfo,
    required this.shippingCost,
    required this.shippingType,
    required this.size,
  });

  int id;
  int customerId;
  String cartGroupId;
  int productId;
  dynamic color;
  List<dynamic> choices;
  List<Variation> variations;
  String variant;
  int quantity;
  int price;
  double tax;
  double discount;
  String slug;
  String name;
  String thumbnail;
  int sellerId;
  String sellerIs;
  DateTime createdAt;
  DateTime updatedAt;
  String shopInfo;
  int shippingCost;
  String shippingType;
  String size;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        customerId: json["customer_id"],
        cartGroupId: json["cart_group_id"],
        productId: json["product_id"],
        color: json["color"],
        choices: List<dynamic>.from(json["choices"].map((x) => x)),
        variations: json["variation"] == null ? [] : List<Variation>.from(json["variation"].map((x) => Variation.fromJson(x))),
        variant: json["variant"],
        quantity: json["quantity"],
        price: json["price"],
        tax: json["tax"].toDouble(),
        discount: json["discount"].toDouble(),
        slug: json["slug"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        sellerId: json["seller_id"],
        sellerIs: json["seller_is"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shopInfo: json["shop_info"],
        shippingCost: json["shipping_cost"],
        shippingType: json["shipping_type"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "cart_group_id": cartGroupId,
        "product_id": productId,
        "color": color,
        "choices": List<dynamic>.from(choices.map((x) => x)),
        "variation": List<dynamic>.from(variations.map((x) => x.toJson())),
        "variant": variant,
        "quantity": quantity,
        "price": price,
        "tax": tax,
        "discount": discount,
        "slug": slug,
        "name": name,
        "thumbnail": thumbnail,
        "seller_id": sellerId,
        "seller_is": sellerIs,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "shop_info": shopInfo,
        "shipping_cost": shippingCost,
        "shipping_type": shippingType,
        "size": size,
      };
}
class Variation {
  Variation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  String type;
  int price;
  String? sku;
  int qty;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    type: json["type"],
    price: json["price"],
    sku: json["sku"] == null ? null : json["sku"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "price": price,
    "sku": sku == null ? null : sku,
    "qty": qty,
  };
}
