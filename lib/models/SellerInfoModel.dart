// To parse this JSON data, do
//
//     final sellerInfoModel = sellerInfoModelFromJson(jsonString);

import 'dart:convert';

SellerInfoModel sellerInfoModelFromJson(String str) => SellerInfoModel.fromJson(json.decode(str));

String sellerInfoModelToJson(SellerInfoModel data) => json.encode(data.toJson());

class SellerInfoModel {
  SellerInfoModel({
    this.id,
    this.name,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.streetAddress,
    this.country,
    this.city,
    this.zip,
    this.houseNo,
    this.apartmentNo,
    this.cmFirebaseToken,
    this.isActive,
    this.paymentCardLastFour,
    this.paymentCardBrand,
    this.paymentCardFawryToken,
    this.loginMedium,
    this.socialId,
    this.isPhoneVerified,
    this.temporaryToken,
    this.isEmailVerified,
    this.walletBalance,
    this.loyaltyPoint,
    this.title,
    this.dOB,
    this.newsletter,
    this.country_code,
    this.country_name,
    this.notify_count_unseen,
  });

  int? id;
  dynamic name;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic streetAddress;
  dynamic country;
  dynamic city;
  dynamic zip;
  dynamic houseNo;
  dynamic apartmentNo;
  dynamic cmFirebaseToken;
  int? isActive;
  dynamic paymentCardLastFour;
  dynamic paymentCardBrand;
  dynamic paymentCardFawryToken;
  dynamic loginMedium;
  dynamic socialId;
  int? isPhoneVerified;
  String? temporaryToken;
  int? isEmailVerified;
  dynamic walletBalance;
  dynamic loyaltyPoint;
  String? title;
  String? dOB;
  String? newsletter;
  String? country_code;
  String? country_name;
  int? notify_count_unseen;

  factory SellerInfoModel.fromJson(Map<String, dynamic> json) => SellerInfoModel(
    id: json["id"],
    name: json["name"],
    fName: json["f_name"],
    lName: json["l_name"],
    phone: json["phone"],
    image: json["image"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    streetAddress: json["street_address"],
    country: json["country"],
    city: json["city"],
    zip: json["zip"],
    houseNo: json["house_no"],
    apartmentNo: json["apartment_no"],
    cmFirebaseToken: json["cm_firebase_token"],
    isActive: json["is_active"],
    paymentCardLastFour: json["payment_card_last_four"],
    paymentCardBrand: json["payment_card_brand"],
    paymentCardFawryToken: json["payment_card_fawry_token"],
    loginMedium: json["login_medium"],
    socialId: json["social_id"],
    isPhoneVerified: json["is_phone_verified"],
    temporaryToken: json["temporary_token"],
    isEmailVerified: json["is_email_verified"],
    walletBalance: json["wallet_balance"],
    loyaltyPoint: json["loyalty_point"],
    title: json["title"],
    dOB: json["d_o_b"],
    newsletter: json["newsletter"],
    country_code: json["country_code"],
    country_name: json["country_name"],
    notify_count_unseen: json["notify_count_unseen"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "f_name": fName,
    "l_name": lName,
    "phone": phone,
    "image": image,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toString(),
    "updated_at": updatedAt.toString(),
    "street_address": streetAddress,
    "country": country,
    "city": city,
    "zip": zip,
    "house_no": houseNo,
    "apartment_no": apartmentNo,
    "cm_firebase_token": cmFirebaseToken,
    "is_active": isActive,
    "payment_card_last_four": paymentCardLastFour,
    "payment_card_brand": paymentCardBrand,
    "payment_card_fawry_token": paymentCardFawryToken,
    "login_medium": loginMedium,
    "social_id": socialId,
    "is_phone_verified": isPhoneVerified,
    "temporary_token": temporaryToken,
    "is_email_verified": isEmailVerified,
    "wallet_balance": walletBalance,
    "loyalty_point": loyaltyPoint,
    "title": title,
    "d_o_b": dOB,
    "newsletter": newsletter,
    "country_code": country_code,
    "country_name": country_name,
    "notify_count_unseen": notify_count_unseen,
  };
}
