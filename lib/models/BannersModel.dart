// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  BannerModel({
    this.id,
    this.photo,
    this.bannerType,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.resourceType,
    this.resourceId,
  });

  int? id;
  String? photo;
  String? bannerType;
  int? published;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;
  String? resourceType;
  int? resourceId;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    photo: json["photo"],
    bannerType: json["banner_type"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"],
    resourceType: json["resource_type"],
    resourceId: json["resource_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo": photo,
    "banner_type": bannerType,
    "published": published,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "url": url,
    "resource_type": resourceType,
    "resource_id": resourceId,
  };
}
