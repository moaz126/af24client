// // To parse required this JSON data, do
// //
// //     final notificationsModel = notificationsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<NotificationsModel> notificationsModelFromJson(String str) => List<NotificationsModel>.from(json.decode(str).map((x) => NotificationsModel.fromJson(x)));
//
// String notificationsModelToJson(List<NotificationsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class NotificationsModel {
//   NotificationsModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.status,
//     required this.userId,
//     required this.type,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String title;
//   String description;
//   dynamic image;
//   int status;
//   int userId;
//   String type;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
//     id: json["id"],
//     title: json["title"],
//     description: json["description"],
//     image: json["image"],
//     status: json["status"],
//     userId: json["user_id"],
//     type: json["type"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "description": description,
//     "image": image,
//     "status": status,
//     "user_id": userId,
//     "type": type,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }





// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

List<NotificationsModel> notificationsModelFromJson(String str) => List<NotificationsModel>.from(json.decode(str).map((x) => NotificationsModel.fromJson(x)));


class NotificationsModel {
  NotificationsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.status,
    required this.userId,
    required this.type,
    required this.orderId,
    required this.customerId,
    required this.data,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
    required this.productId,
    required this.notifyType,
  });

  int id;
  String title;
  String description;
  dynamic image;
  int status;
  int userId;
  String type;
  String? orderId;
  dynamic customerId;
  NotificationsModelData data;
  int seen;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic productId;
  int notifyType;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    status: json["status"],
    userId: json["user_id"],
    type: json["type"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    customerId: json["customer_id"],
    data: NotificationsModelData.fromJson(json["data"]),
    seen: json["seen"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productId: json["product_id"],
    notifyType: json["notify_type"],
  );

}

class NotificationsModelData {
  NotificationsModelData({
    required this.title,
    required this.body,
    required this.data,
    required this.productSlug,
    required this.type,
    required this.userId,
    required this.orderId,
  });

  String title;
  String body;
  DataData data;
  String? productSlug;
  String type;
  int userId;
  int? orderId;

  factory NotificationsModelData.fromJson(Map<String, dynamic> json) => NotificationsModelData(
    title: json["title"],
    body: json["body"],
    data: DataData.fromJson(json["data"]),
    productSlug: json["product_slug"] == null ? null : json["product_slug"],
    type: json["type"],
    userId: json["user_id"],
    orderId: json["order_id"] == null ? null : json["order_id"],
  );

}

class DataData {
  DataData({
    required this.notifyType,
    required this.quantity,
    required this.size,
    required this.color,
  });

  int notifyType;
  int? quantity;
  String? size;
  String? color;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    notifyType: json["notify_type"],
    quantity: json["quantity"],
    size: json["size"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "notify_type": notifyType,
    "quantity": quantity,
    "size": size,
    "color": color,
  };
}
