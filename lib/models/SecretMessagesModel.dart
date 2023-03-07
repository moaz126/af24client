// class ListElement {
//   ListElement({


class ListElement {
  ListElement({
    this.id,
    required this.userId,
    this.sellerId,
    this.productId,
    required this.sendBy,
    required this.message,
    this.createdAt,
    this.updatedAt,
    this.shopName,
    required this.userName,
  });

  int? id;
  int userId;
  int? sellerId;
  int? productId;
  String sendBy;
  String message;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? shopName;
  String userName;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    userId: json["user_id"],
    sellerId: json["seller_id"],
    productId: json["product_id"],
    sendBy: json["send_by"],
    message: json["message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    shopName: json["shop_name"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "seller_id": sellerId,
    "product_id": productId,
    "send_by": sendBy,
    "message": message,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "shop_name": shopName,
    "user_name": userName,
  };
}
