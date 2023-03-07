// To parse this JSON data, do
//
//     final categoriesListModel = categoriesListModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesListModel> categoriesListModelFromJson(String str) => List<CategoriesListModel>.from(json.decode(str).map((x) => CategoriesListModel.fromJson(x)));

String categoriesListModelToJson(List<CategoriesListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesListModel {
  CategoriesListModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.parentId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.homeStatus,
    required this.priority,
    required this.childes,
    required this.translations,
  });

  int id;
  String name;
  String slug;
  String? icon;
  int parentId;
  int position;
  DateTime createdAt;
  DateTime updatedAt;
  int homeStatus;
  int priority;
  List<CategoriesListModel> childes;
  List<dynamic> translations;

  factory CategoriesListModel.fromJson(Map<String, dynamic> json) => CategoriesListModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"] == null ? null : json["icon"],
    parentId: json["parent_id"],
    position: json["position"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    homeStatus: json["home_status"],
    priority: json["priority"],
    childes: List<CategoriesListModel>.from(json["childes"].map((x) => CategoriesListModel.fromJson(x))),
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon == null ? null : icon,
    "parent_id": parentId,
    "position": position,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "home_status": homeStatus,
    "priority": priority,
    "childes": List<dynamic>.from(childes.map((x) => x.toJson())),
    "translations": List<dynamic>.from(translations.map((x) => x)),
  };
}
