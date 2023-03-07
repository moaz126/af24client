// To parse required this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

import 'package:af24client/models/OrderDetailsModel.dart';

List<WishListModel> wishListModelFromJson(String str) => List<WishListModel>.from(json.decode(str).map((x) => WishListModel.fromJson(x)));

String wishListModelToJson(List<WishListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishListModel {
  WishListModel({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.Details,
    required this.product,
  });

  int id;
  int customerId;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;
  DetailsClass Details;
  Product product;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
    id: json["id"],
    customerId: json["customer_id"],
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    Details: DetailsClass.fromJson(json["product_details"]),
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "product_id": productId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_details": Details.toJson(),
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.id,
    required this.slug,
    required this.reviewsCount,
    required this.translations,
    required this.reviews,
  });

  int id;
  String slug;
  int reviewsCount;
  List<dynamic> translations;
  List<Review> reviews;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    slug: json["slug"],
    reviewsCount: json["reviews_count"],
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "reviews_count": reviewsCount,
    "translations": List<dynamic>.from(translations.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}

class Review {
  Review({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.comment,
    required this.attachment,
    required this.rating,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productId;
  int customerId;
  String comment;
  String attachment;
  int rating;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    productId: json["product_id"],
    customerId: json["customer_id"],
    comment: json["comment"],
    attachment: json["attachment"],
    rating: json["rating"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "customer_id": customerId,
    "comment": comment,
    "attachment": attachment,
    "rating": rating,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class DetailsClass {
  DetailsClass({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.name,
    required this.slug,
    required this.categoryIds,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.refundable,
    required this.images,
    required this.thumbnail,
    required this.featured,
    required this.flashDeal,
    required this.videoProvider,
    required this.videoUrl,
    required this.colors,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.variation,
    required this.published,
    required this.unitPrice,
    required this.purchasePrice,
    required this.priceType,
    required this.tax,
    required this.taxType,
    required this.discount,
    required this.discountType,
    required this.currentStock,
    required this.details,
    required this.freeShipping,
    required this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.deniedNote,
    required this.shippingCost,
    required this.multiplyQty,
    required this.tempShippingCost,
    required this.isShippingCostUpdated,
    required this.size,
    required this.subName,
  });

  int id;
  String addedBy;
  int userId;
  String name;
  String slug;
  String categoryIds;
  int brandId;
  String unit;
  int minQty;
  int refundable;
  String images;
  String thumbnail;
  String? featured;
  dynamic flashDeal;
  String videoProvider;
  dynamic videoUrl;
  String colors;
  int variantProduct;
  String attributes;
  String choiceOptions;
  String variation;
  int published;
  int unitPrice;
  int purchasePrice;
  String priceType;
  String tax;
  String? taxType;
  String discount;
  String? discountType;
  int? currentStock;
  String details;
  int freeShipping;
  dynamic attachment;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  int featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? requestStatus;
  dynamic deniedNote;
  int shippingCost;
  int multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  dynamic size;
  String subName;

  factory DetailsClass.fromJson(Map<String, dynamic> json) => DetailsClass(
    id: json["id"],
    addedBy: json["added_by"],
    userId: json["user_id"],
    name: json["name"],
    slug: json["slug"],
    categoryIds: json["category_ids"],
    brandId: json["brand_id"],
    unit: json["unit"],
    minQty: json["min_qty"],
    refundable: json["refundable"],
    images: json["images"],
    thumbnail: json["thumbnail"],
    featured: json["featured"],
    flashDeal: json["flash_deal"],
    videoProvider: json["video_provider"],
    videoUrl: json["video_url"],
    colors: json["colors"],
    variantProduct: json["variant_product"],
    attributes: json["attributes"],
    choiceOptions: json["choice_options"],
    variation: json["variation"],
    published: json["published"],
    unitPrice: json["unit_price"],
    purchasePrice: json["purchase_price"],
    priceType: json["price_type"],
    tax: json["tax"],
    taxType: json["tax_type"],
    discount: json["discount"],
    discountType: json["discount_type"],
    currentStock: json["current_stock"],
    details: json["details"],
    freeShipping: json["free_shipping"],
    attachment: json["attachment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
    featuredStatus: json["featured_status"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaImage: json["meta_image"],
    requestStatus: json["request_status"],
    deniedNote: json["denied_note"],
    shippingCost: json["shipping_cost"],
    multiplyQty: json["multiply_qty"],
    tempShippingCost: json["temp_shipping_cost"],
    isShippingCostUpdated: json["is_shipping_cost_updated"],
    size: json["size"],
    subName: json["sub_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedBy,
    "user_id": userId,
    "name": name,
    "slug": slug,
    "category_ids": categoryIds,
    "brand_id": brandId,
    "unit": unit,
    "min_qty": minQty,
    "refundable": refundable,
    "images": images,
    "thumbnail": thumbnail,
    "featured": featured,
    "flash_deal": flashDeal,
    "video_provider": videoProvider,
    "video_url": videoUrl,
    "colors": colors,
    "variant_product": variantProduct,
    "attributes": attributes,
    "choice_options": choiceOptions,
    "variation": variation,
    "published": published,
    "unit_price": unitPrice,
    "purchase_price": purchasePrice,
    "price_type": priceType,
    "tax": tax,
    "tax_type": taxType,
    "discount": discount,
    "discount_type": discountType,
    "current_stock": currentStock,
    "details": details,
    "free_shipping": freeShipping,
    "attachment": attachment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
    "featured_status": featuredStatus,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_image": metaImage,
    "request_status": requestStatus,
    "denied_note": deniedNote,
    "shipping_cost": shippingCost,
    "multiply_qty": multiplyQty,
    "temp_shipping_cost": tempShippingCost,
    "is_shipping_cost_updated": isShippingCostUpdated,
    "size": size,
    "sub_name": subName,
  };
}
