// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

List<AddressListModel> addressListModelFromJson(String str) => List<AddressListModel>.from(json.decode(str).map((x) => AddressListModel.fromJson(x)));

String addressListModelToJson(List<AddressListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressListModel {
  AddressListModel({
    required this.id,
    required this.customerId,
    required this.contactPersonName,
    required this.addressType,
    required this.address,
    required this.city,
    required this.zip,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  });

  int id;
  int customerId;
  String contactPersonName;
  String addressType;
  String address;
  String city;
  String zip;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic state;
  dynamic country;
  String latitude;
  String longitude;
  int isBilling;

  factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
    id: json["id"],
    customerId: json["customer_id"],
    contactPersonName: json["contact_person_name"],
    addressType: json["address_type"],
    address: json["address"],
    city: json["city"],
    zip: json["zip"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    state: json["state"],
    country: json["country"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    isBilling: json["is_billing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "contact_person_name": contactPersonName,
    "address_type": addressType,
    "address": address,
    "city": city,
    "zip": zip,
    "phone": phone,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "state": state,
    "country": country,
    "latitude": latitude,
    "longitude": longitude,
    "is_billing": isBilling,
  };
}
