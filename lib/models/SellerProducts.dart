// // To parse this JSON data, do
// //
// //     final sellerProducts = sellerProductsFromJson(jsonString);
//
// import 'dart:convert';
//
// List<SellerProducts> sellerProductsFromJson(String str) => List<SellerProducts>.from(json.decode(str).map((x) => SellerProducts.fromJson(x)));
//
// String sellerProductsToJson(List<SellerProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class SellerProducts {
//   SellerProducts({
//     required this.id,
//     required this.addedBy,
//     required this.userId,
//     required this.name,
//     required this.slug,
//     required this.categoryIds,
//     required this.brandId,
//     required this.unit,
//     required this.minQty,
//     required this.refundable,
//     required this.images,
//     required this.thumbnail,
//     required this.featured,
//     required this.flashDeal,
//     required this.videoProvider,
//     required this.videoUrl,
//     required this.colors,
//     required this.variantProduct,
//     required this.attributes,
//     required this.choiceOptions,
//     required this.variation,
//     required this.published,
//     required this.unitPrice,
//     required this.purchasePrice,
//     required this.priceType,
//     required this.tax,
//     required this.taxType,
//     required this.discount,
//     required this.discountType,
//     required this.currentStock,
//     required this.details,
//     required this.freeShipping,
//     required this.attachment,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.status,
//     required this.featuredStatus,
//     required this.metaTitle,
//     required this.metaDescription,
//     required this.metaImage,
//     required this.requestStatus,
//     required this.deniedNote,
//     required this.shippingCost,
//     required this.multiplyQty,
//     required this.tempShippingCost,
//     required this.isShippingCostUpdated,
//     required this.size,
//     required this.subName,
//     required this.reviewsCount,
//     required this.rating,
//     required this.translations,
//     required this.reviews,
//   });
//
//   int?id;
//   String? addedBy;
//   int?userId;
//   String? name;
//   String? slug;
//   List<CategoryId> categoryIds;
//   int?brandId;
//   String? unit;
//   int?minQty;
//   int?refundable;
//   List<String> images;
//   String? thumbnail;
//   int? featured;
//   dynamic flashDeal;
//   String? videoProvider;
//   dynamic videoUrl;
//   List<Color> colors;
//   int?variantProduct;
//   List<dynamic> attributes;
//   List<dynamic> choiceOptions;
//   List<Variation> variation;
//   int?published;
//   int?unitPrice;
//   double purchasePrice;
//   String? priceType;
//   double tax;
//   String? taxType;
//   int?discount;
//   String? discountType;
//   int?currentStock;
//   String? details;
//   int?freeShipping;
//   dynamic attachment;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int?status;
//   int?featuredStatus;
//   String? metaTitle;
//   String? metaDescription;
//   String? metaImage;
//   int?requestStatus;
//   dynamic deniedNote;
//   int?shippingCost;
//   int?multiplyQty;
//   dynamic tempShippingCost;
//   dynamic isShippingCostUpdated;
//   List<dynamic> size;
//   String? subName;
//   int?reviewsCount;
//   List<Rating> rating;
//   List<dynamic> translations;
//   List<Review> reviews;
//
//   factory SellerProducts.fromJson(Map<String, dynamic> json) => SellerProducts(
//     id: json["id"],
//     addedBy: json["added_by"],
//     userId: json["user_id"],
//     name: json["name"],
//     slug: json["slug"],
//     categoryIds: List<CategoryId>.from(json["category_ids"].map((x) => CategoryId.fromJson(x))),
//     brandId: json["brand_id"],
//     unit: json["unit"],
//     minQty: json["min_qty"],
//     refundable: json["refundable"],
//     images: List<String>.from(json["images"].map((x) => x)),
//     thumbnail: json["thumbnail"],
//     featured: json["featured"] == null ? null : json["featured"],
//     flashDeal: json["flash_deal"],
//     videoProvider: json["video_provider"],
//     videoUrl: json["video_url"],
//     colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
//     variantProduct: json["variant_product"],
//     attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
//     choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
//     variation: List<Variation>.from(json["variation"].map((x) => Variation.fromJson(x))),
//     published: json["published"],
//     unitPrice: json["unit_price"],
//     purchasePrice: json["purchase_price"].toDouble(),
//     priceType: json["price_type"],
//     tax: json["tax"].toDouble(),
//     taxType: json["tax_type"] == null ? null : json["tax_type"],
//     discount: json["discount"],
//     discountType: json["discount_type"] == null ? null : json["discount_type"],
//     currentStock: json["current_stock"] == null ? null : json["current_stock"],
//     details: json["details"],
//     freeShipping: json["free_shipping"],
//     attachment: json["attachment"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     status: json["status"],
//     featuredStatus: json["featured_status"],
//     metaTitle: json["meta_title"] == null ? null : json["meta_title"],
//     metaDescription: json["meta_description"] == null ? null : json["meta_description"],
//     metaImage: json["meta_image"] == null ? null : json["meta_image"],
//     requestStatus: json["request_status"],
//     deniedNote: json["denied_note"],
//     shippingCost: json["shipping_cost"],
//     multiplyQty: json["multiply_qty"],
//     tempShippingCost: json["temp_shipping_cost"],
//     isShippingCostUpdated: json["is_shipping_cost_updated"],
//     size: json["size"] == null ? [] : json["size"],
//     subName: json["sub_name"],
//     reviewsCount: json["reviews_count"],
//     rating: List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
//     translations: List<dynamic>.from(json["translations"].map((x) => x)),
//     reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "added_by": addedBy,
//     "user_id": userId,
//     "name": name,
//     "slug": slug,
//     "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
//     "brand_id": brandId,
//     "unit": unit,
//     "min_qty": minQty,
//     "refundable": refundable,
//     "images": List<dynamic>.from(images.map((x) => x)),
//     "thumbnail": thumbnail,
//     "featured": featured == null ? null : featured,
//     "flash_deal": flashDeal,
//     "video_provider": videoProvider,
//     "video_url": videoUrl,
//     "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
//     "variant_product": variantProduct,
//     "attributes": List<dynamic>.from(attributes.map((x) => x)),
//     "choice_options": List<dynamic>.from(choiceOptions.map((x) => x)),
//     "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
//     "published": published,
//     "unit_price": unitPrice,
//     "purchase_price": purchasePrice,
//     "price_type": priceType,
//     "tax": tax,
//     "tax_type": taxType == null ? null : taxType,
//     "discount": discount,
//     "discount_type": discountType == null ? null : discountType,
//     "current_stock": currentStock == null ? null : currentStock,
//     "details": details,
//     "free_shipping": freeShipping,
//     "attachment": attachment,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "status": status,
//     "featured_status": featuredStatus,
//     "meta_title": metaTitle == null ? null : metaTitle,
//     "meta_description": metaDescription == null ? null : metaDescription,
//     "meta_image": metaImage == null ? null : metaImage,
//     "request_status": requestStatus,
//     "denied_note": deniedNote,
//     "shipping_cost": shippingCost,
//     "multiply_qty": multiplyQty,
//     "temp_shipping_cost": tempShippingCost,
//     "is_shipping_cost_updated": isShippingCostUpdated,
//     "size": size == null ? [] : size,
//     "sub_name": subName,
//     "reviews_count": reviewsCount,
//     "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
//     "translations": List<dynamic>.from(translations.map((x) => x)),
//     "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
//   };
// }
//
// class CategoryId {
//   CategoryId({
//     required this.id,
//     required this.position,
//   });
//
//   String? id;
//   int?position;
//
//   factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
//     id: json["id"],
//     position: json["position"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "position": position,
//   };
// }
//
// class Color {
//   Color({
//     required this.name,
//     required this.code,
//   });
//
//   String? name;
//   String? code;
//
//   factory Color.fromJson(Map<String, dynamic> json) => Color(
//     name: json["name"],
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "code": code,
//   };
// }
//
// class Rating {
//   Rating({
//     required this.average,
//     required this.productId,
//   });
//
//   String? average;
//   int?productId;
//
//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//     average: json["average"],
//     productId: json["product_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "average": average,
//     "product_id": productId,
//   };
// }
//
// class Review {
//   Review({
//     required this.id,
//     required this.productId,
//     required this.customerId,
//     required this.comment,
//     required this.attachment,
//     required this.rating,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int?id;
//   int?productId;
//   int?customerId;
//   String? comment;
//   String? attachment;
//   int?rating;
//   int?status;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Review.fromJson(Map<String, dynamic> json) => Review(
//     id: json["id"],
//     productId: json["product_id"],
//     customerId: json["customer_id"],
//     comment: json["comment"],
//     attachment: json["attachment"],
//     rating: json["rating"],
//     status: json["status"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "product_id": productId,
//     "customer_id": customerId,
//     "comment": comment,
//     "attachment": attachment,
//     "rating": rating,
//     "status": status,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class Variation {
//   Variation({
//     required this.type,
//     required this.price,
//     required this.sku,
//     required this.qty,
//   });
//
//   String? type;
//   int?price;
//   String? sku;
//   int?qty;
//
//   factory Variation.fromJson(Map<String, dynamic> json) => Variation(
//     type: json["type"],
//     price: json["price"],
//     sku: json["sku"],
//     qty: json["qty"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": type,
//     "price": price,
//     "sku": sku,
//     "qty": qty,
//   };
// }







// To parse this JSON data, do
//
//     final sellerProducts = sellerProductsFromJson(jsonString);

import 'dart:convert';

List<SellerProducts> sellerProductsFromJson(String str) => List<SellerProducts>.from(json.decode(str).map((x) => SellerProducts.fromJson(x)));

String sellerProductsToJson(List<SellerProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SellerProducts {
  SellerProducts({
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
    required this.wholesalePrice,
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
    required this.secretPayment,
    required this.sizeFit,
    required this.deliveryReturns,
    required this.reviewsCount,
    required this.secretComments,
    required this.rating,
    required this.brand,
    required this.translations,
    required this.reviews,
  });

  int id;
  String addedBy;
  int userId;
  String name;
  String slug;
  List<CategoryId> categoryIds;
  int brandId;
  String unit;
  int minQty;
  int refundable;
  List<String> images;
  String thumbnail;
  dynamic featured;
  dynamic flashDeal;
  String videoProvider;
  dynamic videoUrl;
  List<Color> colors;
  int variantProduct;
  List<dynamic> attributes;
  List<dynamic> choiceOptions;
  List<Variation> variation;
  int published;
  int unitPrice;
  int purchasePrice;
  String priceType;
  int wholesalePrice;
  int tax;
  dynamic taxType;
  int discount;
  String? discountType;
  int? currentStock;
  String? details;
  int freeShipping;
  dynamic attachment;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  int featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int requestStatus;
  dynamic deniedNote;
  int shippingCost;
  int multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  List<String>? size;
  String subName;
  int secretPayment;
  dynamic sizeFit;
  dynamic deliveryReturns;
  int reviewsCount;
  int secretComments;
  List<dynamic> rating;
  Brand brand;
  List<dynamic> translations;
  List<dynamic> reviews;

  factory SellerProducts.fromJson(Map<String, dynamic> json) => SellerProducts(
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
    colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
    variantProduct: json["variant_product"],
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
    variation: List<Variation>.from(json["variation"].map((x) => Variation.fromJson(x))),
    published: json["published"],
    unitPrice: json["unit_price"],
    purchasePrice: json["purchase_price"],
    priceType: json["price_type"],
    wholesalePrice: json["wholesale_price"],
    tax: json["tax"],
    taxType: json["tax_type"],
    discount: json["discount"],
    discountType: json["discount_type"] == null ? null : json["discount_type"],
    currentStock: json["current_stock"] == null ? null : json["current_stock"],
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
    size: json["size"] == null ? null : List<String>.from(json["size"].map((x) => x)),
    subName: json["sub_name"],
    secretPayment: json["secret_payment"],
    sizeFit: json["size_fit"],
    deliveryReturns: json["delivery_returns"],
    reviewsCount: json["reviews_count"],
    secretComments: json["secret_comments"],
    rating: List<dynamic>.from(json["rating"].map((x) => x)),
    brand: Brand.fromJson(json["brand"]),
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedBy,
    "user_id": userId,
    "name": name,
    "slug": slug,
    "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
    "brand_id": brandId,
    "unit": unit,
    "min_qty": minQty,
    "refundable": refundable,
    "images": List<dynamic>.from(images.map((x) => x)),
    "thumbnail": thumbnail,
    "featured": featured,
    "flash_deal": flashDeal,
    "video_provider": videoProvider,
    "video_url": videoUrl,
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "variant_product": variantProduct,
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "choice_options": List<dynamic>.from(choiceOptions.map((x) => x)),
    "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
    "published": published,
    "unit_price": unitPrice,
    "purchase_price": purchasePrice,
    "price_type": priceType,
    "wholesale_price": wholesalePrice,
    "tax": tax,
    "tax_type": taxType,
    "discount": discount,
    "discount_type": discountType == null ? null : discountType,
    "current_stock": currentStock == null ? null : currentStock,
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
    "size": List<dynamic>.from(size!.map((x) => x)),
    "sub_name": subName,
    "secret_payment": secretPayment,
    "size_fit": sizeFit,
    "delivery_returns": deliveryReturns,
    "reviews_count": reviewsCount,
    "secret_comments": secretComments,
    "rating": List<dynamic>.from(rating.map((x) => x)),
    "brand": brand.toJson(),
    "translations": List<dynamic>.from(translations.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
  };
}

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.translations,
  });

  int id;
  String name;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> translations;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "translations": List<dynamic>.from(translations.map((x) => x)),
  };
}

class CategoryId {
  CategoryId({
    required this.id,
    required this.position,
  });

  String id;
  int position;

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
  };
}

class Color {
  Color({
    required this.name,
    required this.code,
  });

  String name;
  String code;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
}

class Variation {
  Variation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  String type;
  int price;
  String? sku;
  int qty;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    type: json["type"],
    price: json["price"],
    sku: json["sku"] == null ? null : json["sku"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "price": price,
    "sku": sku == null ? null : sku,
    "qty": qty,
  };
}
