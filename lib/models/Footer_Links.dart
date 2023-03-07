// To parse required this JSON data, do
//
//     final footerLinks = footerLinksFromJson(jsonString);

import 'dart:convert';

FooterLinks footerLinksFromJson(String str) => FooterLinks.fromJson(json.decode(str));

String footerLinksToJson(FooterLinks data) => json.encode(data.toJson());

class FooterLinks {
  FooterLinks({
    required this.id,
    required this.type,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String type;
  String value;
  dynamic createdAt;
  DateTime updatedAt;

  factory FooterLinks.fromJson(Map<String, dynamic> json) => FooterLinks(
    id: json["id"],
    type: json["type"],
    value: json["value"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "value": value,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}
