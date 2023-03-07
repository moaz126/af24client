// To parse required this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'dart:convert';

List<ChatListModel> chatListModelFromJson(String str) => List<ChatListModel>.from(json.decode(str).map((x) => ChatListModel.fromJson(x)));

String chatListModelToJson(List<ChatListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatListModel {
  ChatListModel({
    required this.id,
    required this.userId,
    required this.sellerId,
    required this.message,
    required this.sentByCustomer,
    required this.sentBySeller,
    required this.seenByCustomer,
    required this.seenBySeller,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.shopId,
    required this.messageData,
    required this.specialMessage,
    required this.shopImage,
    required this.shopName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.sellerInfo,
    required this.customer,
    required this.shop,
  });

  int id;
  int userId;
  int sellerId;
  String message;
  int sentByCustomer;
  int sentBySeller;
  int seenByCustomer;
  int seenBySeller;
  int status;
  DateTime createdAt;
  DateTime? updatedAt;
  int shopId;
  MessageData? messageData;
  bool specialMessage;
  String shopImage;
  String shopName;
  String lastMessage;
  DateTime lastMessageTime;
  SellerInfo? sellerInfo;
  Customer customer;
  Shop shop;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
    id: json["id"],
    userId: json["user_id"],
    sellerId: json["seller_id"],
    message: json["message"],
    sentByCustomer: json["sent_by_customer"],
    sentBySeller: json["sent_by_seller"],
    seenByCustomer: json["seen_by_customer"],
    seenBySeller: json["seen_by_seller"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    shopId: json["shop_id"],
    messageData: json["message_data"] == null ? null : MessageData.fromJson(json["message_data"]),
    specialMessage: json["special_message"],
    shopImage: json["shop_image"],
    shopName: json["shop_name"],
    lastMessage: json["last_message"],
    lastMessageTime: DateTime.parse(json["last_message_time"]),
    sellerInfo: json["seller_info"] == null ? null : SellerInfo.fromJson(json["seller_info"]),
    customer: Customer.fromJson(json["customer"]),
    shop: Shop.fromJson(json["shop"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "seller_id": sellerId,
    "message": message,
    "sent_by_customer": sentByCustomer,
    "sent_by_seller": sentBySeller,
    "seen_by_customer": seenByCustomer,
    "seen_by_seller": seenBySeller,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "shop_id": shopId,
    "message_data": messageData == null ? null : messageData!.toJson(),
    "special_message": specialMessage,
    "shop_image": shopImage,
    "shop_name": shopName,
    "last_message": lastMessage,
    "last_message_time": lastMessageTime.toIso8601String(),
    "seller_info": sellerInfo!.toJson(),
    "customer": customer.toJson(),
    "shop": shop.toJson(),
  };
}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.streetAddress,
    required this.country,
    required this.city,
    required this.zip,
    required this.houseNo,
    required this.apartmentNo,
    required this.cmFirebaseToken,
    required this.isActive,
    required this.paymentCardLastFour,
    required this.paymentCardBrand,
    required this.paymentCardFawryToken,
    required this.loginMedium,
    required this.socialId,
    required this.isPhoneVerified,
    required this.temporaryToken,
    required this.isEmailVerified,
    required this.walletBalance,
    required this.loyaltyPoint,
    required this.title,
    required this.dOB,
    required this.newsletter,
    required this.folowed,
    required this.followedSeller,
  });

  int id;
  dynamic name;
  String fName;
  String lName;
  String phone;
  String image;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic streetAddress;
  dynamic country;
  dynamic city;
  dynamic zip;
  dynamic houseNo;
  dynamic apartmentNo;
  String cmFirebaseToken;
  int isActive;
  dynamic paymentCardLastFour;
  dynamic paymentCardBrand;
  dynamic paymentCardFawryToken;
  dynamic loginMedium;
  dynamic socialId;
  int isPhoneVerified;
  String temporaryToken;
  int isEmailVerified;
  dynamic walletBalance;
  dynamic loyaltyPoint;
  String title;
  String? dOB;
  String? newsletter;
  String? folowed;
  String? followedSeller;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    fName: json["f_name"],
    lName: json["l_name"],
    phone: json["phone"],
    image: json["image"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    folowed: json["folowed"],
    followedSeller: json["followed_seller"],
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
    "folowed": folowed,
    "followed_seller": followedSeller,
  };
}

class MessageData {
  MessageData({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.actualPrice,
  });

  String productId;
  String productName;
  String quantity;
  String actualPrice;

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
    productId: json["product_id"],
    productName: json["product_name"],
    quantity: json["quantity"],
    actualPrice: json["actual_price"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "quantity": quantity,
    "actual_price": actualPrice,
  };
}

class SellerInfo {
  SellerInfo({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
    required this.password,
    required this.status,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.bankName,
    required this.branch,
    required this.accountNo,
    required this.holderName,
    required this.authToken,
    required this.salesCommissionPercentage,
    required this.gst,
    required this.cmFirebaseToken,
    required this.posStatus,
  });

  int id;
  String fName;
  String lName;
  String phone;
  String image;
  String email;
  String password;
  String status;
  String? rememberToken;
  DateTime createdAt;
  DateTime updatedAt;
  String? bankName;
  String? branch;
  String? accountNo;
  String? holderName;
  String? authToken;
  dynamic salesCommissionPercentage;
  dynamic gst;
  String? cmFirebaseToken;
  int posStatus;

  factory SellerInfo.fromJson(Map<String, dynamic> json) => SellerInfo(
    id: json["id"],
    fName: json["f_name"],
    lName: json["l_name"],
    phone: json["phone"],
    image: json["image"],
    email: json["email"],
    password: json["password"],
    status: json["status"],
    rememberToken: json["remember_token"] == null ? null : json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bankName: json["bank_name"] == null ? null : json["bank_name"],
    branch: json["branch"] == null ? null : json["branch"],
    accountNo: json["account_no"] == null ? null : json["account_no"],
    holderName: json["holder_name"] == null ? null : json["holder_name"],
    authToken: json["auth_token"] == null ? null : json["auth_token"],
    salesCommissionPercentage: json["sales_commission_percentage"],
    gst: json["gst"],
    cmFirebaseToken: json["cm_firebase_token"] == null ? null : json["cm_firebase_token"],
    posStatus: json["pos_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fName,
    "l_name": lName,
    "phone": phone,
    "image": image,
    "email": email,
    "password": password,
    "status": status,
    "remember_token": rememberToken == null ? null : rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "bank_name": bankName == null ? null : bankName,
    "branch": branch == null ? null : branch,
    "account_no": accountNo == null ? null : accountNo,
    "holder_name": holderName == null ? null : holderName,
    "auth_token": authToken == null ? null : authToken,
    "sales_commission_percentage": salesCommissionPercentage,
    "gst": gst,
    "cm_firebase_token": cmFirebaseToken == null ? null : cmFirebaseToken,
    "pos_status": posStatus,
  };
}

class Shop {
  Shop({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.address,
    required this.contact,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.banner,
  });

  int id;
  int sellerId;
  String name;
  String address;
  String contact;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String banner;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    sellerId: json["seller_id"],
    name: json["name"],
    address: json["address"],
    contact: json["contact"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_id": sellerId,
    "name": name,
    "address": address,
    "contact": contact,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "banner": banner,
  };
}
