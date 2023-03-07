// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

List<OrderListModel> orderListModelFromJson(String str) => List<OrderListModel>.from(json.decode(str).map((x) => OrderListModel.fromJson(x)));

String orderListModelToJson(List<OrderListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderListModel {
  OrderListModel({
    required this.id,
    required this.customerId,
    required this.customerType,
    required this.paymentStatus,
    required this.orderStatus,
    required this.paymentMethod,
    required this.transactionRef,
    required this.orderAmount,
    required this.shippingAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.discountAmount,
    required this.discountType,
    required this.couponCode,
    required this.shippingMethodId,
    required this.shippingCost,
    required this.orderGroupId,
    required this.verificationCode,
    required this.sellerId,
    required this.sellerIs,
    required this.shippingAddressData,
    required this.deliveryManId,
    required this.orderNote,
    required this.billingAddress,
    required this.billingAddressData,
    required this.orderType,
    required this.extraDiscount,
    required this.extraDiscountType,
    required this.checked,
    required this.shippingType,
    required this.deliveryType,
    required this.deliveryServiceName,
    required this.thirdPartyDeliveryTrackingId,
    required this.deliveryMan,
  });

  int id;
  int customerId;
  String customerType;
  String paymentStatus;
  String orderStatus;
  String paymentMethod;
  String transactionRef;
  double orderAmount;
  dynamic shippingAddress;
  DateTime createdAt;
  DateTime updatedAt;
  int discountAmount;
  dynamic discountType;
  dynamic couponCode;
  int shippingMethodId;
  int shippingCost;
  String orderGroupId;
  String verificationCode;
  int? sellerId;
  String sellerIs;
  dynamic shippingAddressData;
  dynamic deliveryManId;
  dynamic orderNote;
  dynamic billingAddress;
  dynamic billingAddressData;
  String orderType;
  int extraDiscount;
  dynamic extraDiscountType;
  int checked;
  String shippingType;
  dynamic deliveryType;
  dynamic deliveryServiceName;
  dynamic thirdPartyDeliveryTrackingId;
  dynamic deliveryMan;

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    id: json["id"],
    customerId: json["customer_id"],
    customerType: json["customer_type"],
    paymentStatus: json["payment_status"],
    orderStatus: json["order_status"],
    paymentMethod: json["payment_method"],
    transactionRef: json["transaction_ref"],
    orderAmount: json["order_amount"].toDouble(),
    shippingAddress: json["shipping_address"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    discountAmount: json["discount_amount"],
    discountType: json["discount_type"],
    couponCode: json["coupon_code"],
    shippingMethodId: json["shipping_method_id"],
    shippingCost: json["shipping_cost"],
    orderGroupId: json["order_group_id"],
    verificationCode: json["verification_code"],
    sellerId: json["seller_id"],
    sellerIs: json["seller_is"],
    shippingAddressData: json["shipping_address_data"],
    deliveryManId: json["delivery_man_id"],
    orderNote: json["order_note"],
    billingAddress: json["billing_address"],
    billingAddressData: json["billing_address_data"],
    orderType: json["order_type"],
    extraDiscount: json["extra_discount"],
    extraDiscountType: json["extra_discount_type"],
    checked: json["checked"],
    shippingType: json["shipping_type"],
    deliveryType: json["delivery_type"],
    deliveryServiceName: json["delivery_service_name"],
    thirdPartyDeliveryTrackingId: json["third_party_delivery_tracking_id"],
    deliveryMan: json["delivery_man"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "customer_type": customerType,
    "payment_status": paymentStatus,
    "order_status": orderStatus,
    "payment_method": paymentMethod,
    "transaction_ref": transactionRef,
    "order_amount": orderAmount,
    "shipping_address": shippingAddress,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "discount_amount": discountAmount,
    "discount_type": discountType,
    "coupon_code": couponCode,
    "shipping_method_id": shippingMethodId,
    "shipping_cost": shippingCost,
    "order_group_id": orderGroupId,
    "verification_code": verificationCode,
    "seller_id": sellerId,
    "seller_is": sellerIs,
    "shipping_address_data": shippingAddressData,
    "delivery_man_id": deliveryManId,
    "order_note": orderNote,
    "billing_address": billingAddress,
    "billing_address_data": billingAddressData,
    "order_type": orderType,
    "extra_discount": extraDiscount,
    "extra_discount_type": extraDiscountType,
    "checked": checked,
    "shipping_type": shippingType,
    "delivery_type": deliveryType,
    "delivery_service_name": deliveryServiceName,
    "third_party_delivery_tracking_id": thirdPartyDeliveryTrackingId,
    "delivery_man": deliveryMan,
  };
}
