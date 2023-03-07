// To parse required this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
     this.id,
     this.addedBy,
     this.userId,
     this.name,
     this.slug,
     this.categoryIds,
     this.brandId,
     this.unit,
     this.minQty,
     this.refundable,
     this.images,
     this.thumbnail,
     this.featured,
     this.flashDeal,
     this.videoProvider,
     this.videoUrl,
     this.colors,
     this.variantProduct,
     this.attributes,
     this.choiceOptions,
     this.variation,
     this.published,
     this.unitPrice,
     this.purchasePrice,
     this.priceType,
     this.tax,
     this.taxType,
     this.discount,
     this.discountType,
     this.currentStock,
     this.details,
     this.freeShipping,
     this.attachment,
     this.createdAt,
     this.updatedAt,
     this.status,
     this.featuredStatus,
     this.metaTitle,
     this.metaDescription,
     this.metaImage,
     this.requestStatus,
     this.deniedNote,
     this.shippingCost,
     this.multiplyQty,
     this.tempShippingCost,
     this.isShippingCostUpdated,
     this.size,
     this.subName,
     this.reviewsCount,
     this.reviews,
     this.translations,
  });

  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  List<CategoryId>? categoryIds;
  int? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  List<String>? images;
  String? thumbnail;
  dynamic featured;
  dynamic flashDeal;
  String? videoProvider;
  dynamic videoUrl;
  List<dynamic>? colors;
  int? variantProduct;
  List<dynamic>? attributes;
  List<dynamic>? choiceOptions;
  List<dynamic>? variation;
  int? published;
  int? unitPrice;
  int? purchasePrice;
  String? priceType;
  int? tax;
  dynamic taxType;
  int? discount;
  dynamic discountType;
  dynamic currentStock;
  String? details;
  int? freeShipping;
  dynamic attachment;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  int? featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int? requestStatus;
  dynamic deniedNote;
  int? shippingCost;
  int? multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String? size;
  String? subName;
  int? reviewsCount;
  List<dynamic>? reviews;
  List<dynamic>? translations;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    id: json["id"],
    addedBy: json["added_by"],
    userId: json["user_id"],
    name: json["name"],
    slug: json["slug"],
    categoryIds: List<CategoryId>.from(json["category_ids"].map((x) => CategoryId.fromJson(x))),
    brandId: json["brand_id"],
    unit: json["unit"],
    minQty: json["min_qty"],
    refundable: json["refundable"],
    images: List<String>.from(json["images"].map((x) => x)),
    thumbnail: json["thumbnail"],
    featured: json["featured"],
    flashDeal: json["flash_deal"],
    videoProvider: json["video_provider"],
    videoUrl: json["video_url"],
    colors: List<dynamic>.from(json["colors"].map((x) => x)),
    variantProduct: json["variant_product"],
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
    variation: List<dynamic>.from(json["variation"].map((x) => x)),
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
    reviewsCount: json["reviews_count"],
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedBy,
    "user_id": userId,
    "name": name,
    "slug": slug,
    "category_ids": List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
    "brand_id": brandId,
    "unit": unit,
    "min_qty": minQty,
    "refundable": refundable,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "thumbnail": thumbnail,
    "featured": featured,
    "flash_deal": flashDeal,
    "video_provider": videoProvider,
    "video_url": videoUrl,
    "colors": List<dynamic>.from(colors!.map((x) => x)),
    "variant_product": variantProduct,
    "attributes": List<dynamic>.from(attributes!.map((x) => x)),
    "choice_options": List<dynamic>.from(choiceOptions!.map((x) => x)),
    "variation": List<dynamic>.from(variation!.map((x) => x)),
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
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
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
    "reviews_count": reviewsCount,
    "reviews": List<dynamic>.from(reviews!.map((x) => x)),
    "translations": List<dynamic>.from(translations!.map((x) => x)),
  };
}

class CategoryId {
  CategoryId({
     this.id,
     this.position,
  });

  String? id;
  int? position;

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
  };
}
