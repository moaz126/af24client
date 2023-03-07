// // // To parse required required this JSON data, do
// // //
// // //     final orderDeatilsModel = orderDeatilsModelFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // class OrderDeatilsModel {
// //   OrderDeatilsModel({
// //     required this.id,
// //     required this.orderId,
// //     required this.productId,
// //     required this.sellerId,
// //     required this.productDetails,
// //     required this.qty,
// //     required this.price,
// //     required this.tax,
// //     required this.discount,
// //     required this.deliveryStatus,
// //     required this.paymentStatus,
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.shippingMethodId,
// //     required this.variant,
// //     required this.variation,
// //     required this.discountType,
// //     required this.isStockDecreased,
// //     required this.refundRequest,
// //     required this.userEmail,
// //     required this.userName,
// //     required this.userContact,
// //   });
// //
// //   int id;
// //   int orderId;
// //   int productId;
// //   int sellerId;
// //   ProductDetails productDetails;
// //   int qty;
// //   int price;
// //   double tax;
// //   int discount;
// //   String deliveryStatus;
// //   String paymentStatus;
// //   DateTime createdAt;
// //   DateTime updatedAt;
// //   dynamic shippingMethodId;
// //   String variant;
// //   List<Variation> variation;
// //   String discountType;
// //   int isStockDecreased;
// //   int refundRequest;
// //   String userEmail;
// //   String userName;
// //   String userContact;
// //
// //   factory OrderDeatilsModel.fromJson(Map<String, dynamic> json) => OrderDeatilsModel(
// //     id: json["id"],
// //     orderId: json["order_id"],
// //     productId: json["product_id"],
// //     sellerId: json["seller_id"],
// //     productDetails: ProductDetails.fromJson(json["product_details"]),
// //     qty: json["qty"],
// //     price: json["price"],
// //     tax: json["tax"].toDouble(),
// //     discount: json["discount"],
// //     deliveryStatus: json["delivery_status"],
// //     paymentStatus: json["payment_status"],
// //     createdAt: DateTime.parse(json["created_at"]),
// //     updatedAt: DateTime.parse(json["updated_at"]),
// //     shippingMethodId: json["shipping_method_id"],
// //     variant: json["variant"],
// //     variation: List<Variation>.from(
// //         json['product_details']["variation"].map((x) => Variation.fromJson(x))),
// //     discountType: json["discount_type"],
// //     isStockDecreased: json["is_stock_decreased"],
// //     refundRequest: json["refund_request"],
// //     userEmail: json["user_email"],
// //     userName: json["user_name"],
// //     userContact: json["user_contact"],
// //   );
// //
// // }
// //
// // class ProductDetails {
// //   ProductDetails({
// //     required this.id,
// //     required this.addedBy,
// //     required this.userId,
// //     required this.name,
// //     required this.slug,
// //     required this.categoryIds,
// //     required this.brandId,
// //     required this.unit,
// //     required this.minQty,
// //     required this.refundable,
// //     required this.images,
// //     required this.thumbnail,
// //     required this.featured,
// //     required this.flashDeal,
// //     required this.videoProvider,
// //     required this.videoUrl,
// //     required this.colors,
// //     required this.variantProduct,
// //     required this.attributes,
// //     required this.choiceOptions,
// //     required this.variation,
// //     required this.published,
// //     required this.unitPrice,
// //     required this.purchasePrice,
// //     required this.priceType,
// //     required this.tax,
// //     required this.taxType,
// //     required this.discount,
// //     required this.discountType,
// //     required this.currentStock,
// //     required this.details,
// //     required this.freeShipping,
// //     required this.attachment,
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.status,
// //     required this.featuredStatus,
// //     required this.metaTitle,
// //     required this.metaDescription,
// //     required this.metaImage,
// //     required this.requestStatus,
// //     required this.deniedNote,
// //     required this.shippingCost,
// //     required this.multiplyQty,
// //     required this.tempShippingCost,
// //     required this.isShippingCostUpdated,
// //     required this.size,
// //     required this.subName,
// //     required this.secretPayment,
// //     required this.reviewsCount,
// //     required this.translations,
// //     required this.reviews,
// //   });
// //
// //   int id;
// //   String addedBy;
// //   int userId;
// //   String name;
// //   String slug;
// //   List<CategoryId> categoryIds;
// //   int brandId;
// //   String unit;
// //   int minQty;
// //   int refundable;
// //   List<String> images;
// //   String thumbnail;
// //   dynamic featured;
// //   dynamic flashDeal;
// //   String videoProvider;
// //   dynamic videoUrl;
// //   List<Color> colors;
// //   int variantProduct;
// //   List<dynamic> attributes;
// //   List<dynamic> choiceOptions;
// //   List<Variation> variation;
// //   int published;
// //   int unitPrice;
// //   int purchasePrice;
// //   String priceType;
// //   int tax;
// //   String? taxType;
// //   int discount;
// //   String? discountType;
// //   int currentStock;
// //   String details;
// //   int freeShipping;
// //   dynamic attachment;
// //   DateTime createdAt;
// //   DateTime updatedAt;
// //   int status;
// //   int featuredStatus;
// //   dynamic metaTitle;
// //   dynamic metaDescription;
// //   dynamic metaImage;
// //   int requestStatus;
// //   dynamic deniedNote;
// //   int shippingCost;
// //   int multiplyQty;
// //   dynamic tempShippingCost;
// //   dynamic isShippingCostUpdated;
// //   List<String> size;
// //   String subName;
// //   int? secretPayment;
// //   int reviewsCount;
// //   List<dynamic> translations;
// //   List<dynamic> reviews;
// //
// //   factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
// //     id: json["id"],
// //     addedBy: json["added_by"],
// //     userId: json["user_id"],
// //     name: json["name"],
// //     slug: json["slug"],
// //     categoryIds: List<CategoryId>.from(json["category_ids"].map((x) => CategoryId.fromJson(x))),
// //     brandId: json["brand_id"],
// //     unit: json["unit"],
// //     minQty: json["min_qty"],
// //     refundable: json["refundable"],
// //     images: List<String>.from(json["images"].map((x) => x)),
// //     thumbnail: json["thumbnail"],
// //     featured: json["featured"],
// //     flashDeal: json["flash_deal"],
// //     videoProvider: json["video_provider"],
// //     videoUrl: json["video_url"],
// //     colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
// //     variantProduct: json["variant_product"],
// //     attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
// //     choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
// //     variation: List<Variation>.from(json["variation"].map((x) => Variation.fromJson(x))),
// //     published: json["published"],
// //     unitPrice: json["unit_price"],
// //     purchasePrice: json["purchase_price"],
// //     priceType: json["price_type"],
// //     tax: json["tax"],
// //     taxType: json["tax_type"],
// //     discount: json["discount"],
// //     discountType: json["discount_type"],
// //     currentStock: json["current_stock"],
// //     details: json["details"],
// //     freeShipping: json["free_shipping"],
// //     attachment: json["attachment"],
// //     createdAt: DateTime.parse(json["created_at"]),
// //     updatedAt: DateTime.parse(json["updated_at"]),
// //     status: json["status"],
// //     featuredStatus: json["featured_status"],
// //     metaTitle: json["meta_title"],
// //     metaDescription: json["meta_description"],
// //     metaImage: json["meta_image"],
// //     requestStatus: json["request_status"],
// //     deniedNote: json["denied_note"],
// //     shippingCost: json["shipping_cost"],
// //     multiplyQty: json["multiply_qty"],
// //     tempShippingCost: json["temp_shipping_cost"],
// //     isShippingCostUpdated: json["is_shipping_cost_updated"],
// //     size: json["size"] == null ? [] : List<String>.from(json["size"].map((x) => x)),
// //     subName: json["sub_name"],
// //     secretPayment: json["secret_payment"],
// //     reviewsCount: json["reviews_count"],
// //     translations: List<dynamic>.from(json["translations"].map((x) => x)),
// //     reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "added_by": addedBy,
// //     "user_id": userId,
// //     "name": name,
// //     "slug": slug,
// //     "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
// //     "brand_id": brandId,
// //     "unit": unit,
// //     "min_qty": minQty,
// //     "refundable": refundable,
// //     "images": List<dynamic>.from(images.map((x) => x)),
// //     "thumbnail": thumbnail,
// //     "featured": featured,
// //     "flash_deal": flashDeal,
// //     "video_provider": videoProvider,
// //     "video_url": videoUrl,
// //     "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
// //     "variant_product": variantProduct,
// //     "attributes": List<dynamic>.from(attributes.map((x) => x)),
// //     "choice_options": List<dynamic>.from(choiceOptions.map((x) => x)),
// //     "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
// //     "published": published,
// //     "unit_price": unitPrice,
// //     "purchase_price": purchasePrice,
// //     "price_type": priceType,
// //     "tax": tax,
// //     "tax_type": taxType,
// //     "discount": discount,
// //     "discount_type": discountType,
// //     "current_stock": currentStock,
// //     "details": details,
// //     "free_shipping": freeShipping,
// //     "attachment": attachment,
// //     "created_at": createdAt.toIso8601String(),
// //     "updated_at": updatedAt.toIso8601String(),
// //     "status": status,
// //     "featured_status": featuredStatus,
// //     "meta_title": metaTitle,
// //     "meta_description": metaDescription,
// //     "meta_image": metaImage,
// //     "request_status": requestStatus,
// //     "denied_note": deniedNote,
// //     "shipping_cost": shippingCost,
// //     "multiply_qty": multiplyQty,
// //     "temp_shipping_cost": tempShippingCost,
// //     "is_shipping_cost_updated": isShippingCostUpdated,
// //     "size": List<dynamic>.from(size.map((x) => x)),
// //     "sub_name": subName,
// //     "secret_payment": secretPayment,
// //     "reviews_count": reviewsCount,
// //     "translations": List<dynamic>.from(translations.map((x) => x)),
// //     "reviews": List<dynamic>.from(reviews.map((x) => x)),
// //   };
// // }
// //
// // class CategoryId {
// //   CategoryId({
// //     required this.id,
// //     required this.position,
// //   });
// //
// //   String id;
// //   int position;
// //
// //   factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
// //     id: json["id"],
// //     position: json["position"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "position": position,
// //   };
// // }
// //
// // class Color {
// //   Color({
// //     required this.name,
// //     required this.code,
// //   });
// //
// //   String name;
// //   String code;
// //
// //   factory Color.fromJson(Map<String, dynamic> json) => Color(
// //     name: json["name"],
// //     code: json["code"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "name": name,
// //     "code": code,
// //   };
// // }
// //
// // class VariationElement {
// //   VariationElement({
// //     required this.type,
// //     required this.price,
// //     required this.sku,
// //     required this.qty,
// //   });
// //
// //   String type;
// //   int price;
// //   String sku;
// //   int qty;
// //
// //   factory VariationElement.fromJson(Map<String, dynamic> json) => VariationElement(
// //     type: json["type"],
// //     price: json["price"],
// //     sku: json["sku"],
// //     qty: json["qty"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "type": type,
// //     "price": price,
// //     "sku": sku,
// //     "qty": qty,
// //   };
// // }
// //
// // class OrderDeatilsModelVariation {
// //   OrderDeatilsModelVariation({
// //     required this.color,
// //   });
// //
// //   String color;
// //
// //   factory OrderDeatilsModelVariation.fromJson(Map<String, dynamic> json) => OrderDeatilsModelVariation(
// //     color: json["color"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "color": color,
// //   };
// // }
// // class Variation {
// //   Variation({
// //     required this.type,
// //     required this.price,
// //     required this.sku,
// //     required this.qty,
// //   });
// //
// //   String type;
// //   int price;
// //   String? sku;
// //   int qty;
// //
// //   factory Variation.fromJson(Map<String, dynamic> json) => Variation(
// //     type: json["type"],
// //     price: json["price"],
// //     sku: json["sku"] == null ? null : json["sku"],
// //     qty: json["qty"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "type": type,
// //     "price": price,
// //     "sku": sku == null ? null : sku,
// //     "qty": qty,
// //   };
// // }
//
//
//
//
// // To parse this JSON data, do
// //
// //     final orderDeatilsModel = orderDeatilsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<OrderDeatilsModel> orderDeatilsModelFromJson(String str) => List<OrderDeatilsModel>.from(json.decode(str).map((x) => OrderDeatilsModel.fromJson(x)));
//
// String orderDeatilsModelToJson(List<OrderDeatilsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class OrderDeatilsModel {
//   OrderDeatilsModel({
//     required this.id,
//     required this.orderId,
//     required this.productId,
//     required this.sellerId,
//     required this.productDetails,
//     required this.qty,
//     required this.price,
//     required this.tax,
//     required this.discount,
//     required this.deliveryStatus,
//     required this.paymentStatus,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.shippingMethodId,
//     required this.variant,
//     required this.variation,
//     required this.discountType,
//     required this.isStockDecreased,
//     required this.refundRequest,
//     required this.userEmail,
//     required this.userName,
//     required this.userContact,
//     required this.orderStatus,
//   });
//
//   int id;
//   int orderId;
//   int productId;
//   int sellerId;
//   ProductDetails productDetails;
//   int qty;
//   int price;
//   double tax;
//   int discount;
//   String deliveryStatus;
//   String paymentStatus;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic shippingMethodId;
//   String variant;
//   OrderDeatilsModelVariation? variation;
//   String discountType;
//   int isStockDecreased;
//   int refundRequest;
//   String userEmail;
//   String userName;
//   String userContact;
//   String orderStatus;
//
//   factory OrderDeatilsModel.fromJson(Map<String, dynamic> json) => OrderDeatilsModel(
//     id: json["id"],
//     orderId: json["order_id"],
//     productId: json["product_id"],
//     sellerId: json["seller_id"],
//     productDetails: ProductDetails.fromJson(json["product_details"]),
//     qty: json["qty"],
//     price: json["price"],
//     tax: json["tax"].toDouble(),
//     discount: json["discount"],
//     deliveryStatus: json["delivery_status"],
//     paymentStatus: json["payment_status"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     shippingMethodId: json["shipping_method_id"],
//     variant: json["variant"],
//     variation: json["variation"] == null ? null : OrderDeatilsModelVariation.fromJson(json["variation"]),
//     discountType: json["discount_type"],
//     isStockDecreased: json["is_stock_decreased"],
//     refundRequest: json["refund_request"],
//     userEmail: json["user_email"],
//     userName: json["user_name"],
//     userContact: json["user_contact"],
//     orderStatus: json["order_status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "order_id": orderId,
//     "product_id": productId,
//     "seller_id": sellerId,
//     "product_details": productDetails.toJson(),
//     "qty": qty,
//     "price": price,
//     "tax": tax,
//     "discount": discount,
//     "delivery_status": deliveryStatus,
//     "payment_status": paymentStatus,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "shipping_method_id": shippingMethodId,
//     "variant": variant,
//     "variation": variation!.toJson(),
//     "discount_type": discountType,
//     "is_stock_decreased": isStockDecreased,
//     "refund_request": refundRequest,
//     "user_email": userEmail,
//     "user_name": userName,
//     "user_contact": userContact,
//     "order_status": orderStatus,
//   };
// }
//
// class ProductDetails {
//   ProductDetails({
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
//     required this.wholesalePrice,
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
//     required this.secretPayment,
//     required this.sizeFit,
//     required this.deliveryReturns,
//     required this.reviewsCount,
//     required this.translations,
//     required this.reviews,
//     required this.orderStatus,
//   });
//
//   int id;
//   String addedBy;
//   int userId;
//   String name;
//   String slug;
//   List<CategoryId> categoryIds;
//   int brandId;
//   String unit;
//   int minQty;
//   int refundable;
//   List<String> images;
//   String thumbnail;
//   dynamic featured;
//   dynamic flashDeal;
//   String videoProvider;
//   dynamic videoUrl;
//   List<Color> colors;
//   int variantProduct;
//   List<dynamic> attributes;
//   List<dynamic> choiceOptions;
//   List<VariationElement> variation;
//   int published;
//   int unitPrice;
//   int purchasePrice;
//   String priceType;
//   int? wholesalePrice;
//   int tax;
//   dynamic taxType;
//   int discount;
//   dynamic discountType;
//   int currentStock;
//   String details;
//   int freeShipping;
//   dynamic attachment;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int status;
//   int featuredStatus;
//   dynamic metaTitle;
//   dynamic metaDescription;
//   dynamic metaImage;
//   int requestStatus;
//   dynamic deniedNote;
//   int shippingCost;
//   int multiplyQty;
//   dynamic tempShippingCost;
//   dynamic isShippingCostUpdated;
//   List<String> size;
//   String subName;
//   int secretPayment;
//   dynamic sizeFit;
//   dynamic deliveryReturns;
//   int reviewsCount;
//   List<dynamic> translations;
//   List<dynamic> reviews;
//   String? orderStatus;
//
//   factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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
//     featured: json["featured"],
//     flashDeal: json["flash_deal"],
//     videoProvider: json["video_provider"],
//     videoUrl: json["video_url"],
//     colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
//     variantProduct: json["variant_product"],
//     attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
//     choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
//     variation: List<VariationElement>.from(json["variation"].map((x) => VariationElement.fromJson(x))),
//     published: json["published"],
//     unitPrice: json["unit_price"],
//     purchasePrice: json["purchase_price"],
//     priceType: json["price_type"],
//     wholesalePrice: json["wholesale_price"],
//     tax: json["tax"],
//     taxType: json["tax_type"],
//     discount: json["discount"],
//     discountType: json["discount_type"],
//     currentStock: json["current_stock"],
//     details: json["details"],
//     freeShipping: json["free_shipping"],
//     attachment: json["attachment"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     status: json["status"],
//     featuredStatus: json["featured_status"],
//     metaTitle: json["meta_title"],
//     metaDescription: json["meta_description"],
//     metaImage: json["meta_image"],
//     requestStatus: json["request_status"],
//     deniedNote: json["denied_note"],
//     shippingCost: json["shipping_cost"],
//     multiplyQty: json["multiply_qty"],
//     tempShippingCost: json["temp_shipping_cost"],
//     isShippingCostUpdated: json["is_shipping_cost_updated"],
//     size: List<String>.from(json["size"].map((x) => x)),
//     subName: json["sub_name"],
//     secretPayment: json["secret_payment"],
//     sizeFit: json["size_fit"],
//     orderStatus: json["order_status"],
//     deliveryReturns: json["delivery_returns"],
//     reviewsCount: json["reviews_count"],
//     translations: List<dynamic>.from(json["translations"].map((x) => x)),
//     reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
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
//     "featured": featured,
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
//     "wholesale_price": wholesalePrice,
//     "tax": tax,
//     "tax_type": taxType,
//     "discount": discount,
//     "discount_type": discountType,
//     "current_stock": currentStock,
//     "details": details,
//     "free_shipping": freeShipping,
//     "attachment": attachment,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "status": status,
//     "featured_status": featuredStatus,
//     "meta_title": metaTitle,
//     "meta_description": metaDescription,
//     "meta_image": metaImage,
//     "request_status": requestStatus,
//     "denied_note": deniedNote,
//     "shipping_cost": shippingCost,
//     "multiply_qty": multiplyQty,
//     "temp_shipping_cost": tempShippingCost,
//     "is_shipping_cost_updated": isShippingCostUpdated,
//     "order_status": orderStatus,
//     "size": List<dynamic>.from(size.map((x) => x)),
//     "sub_name": subName,
//     "secret_payment": secretPayment,
//     "size_fit": sizeFit,
//     "delivery_returns": deliveryReturns,
//     "reviews_count": reviewsCount,
//     "translations": List<dynamic>.from(translations.map((x) => x)),
//     "reviews": List<dynamic>.from(reviews.map((x) => x)),
//   };
// }
//
// class CategoryId {
//   CategoryId({
//     required this.id,
//     required this.position,
//   });
//
//   String id;
//   int position;
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
//   String name;
//   String code;
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
// class VariationElement {
//   VariationElement({
//     required this.type,
//     required this.price,
//     required this.sku,
//     required this.qty,
//   });
//
//   String type;
//   int price;
//   String? sku;
//   int qty;
//
//   factory VariationElement.fromJson(Map<String, dynamic> json) => VariationElement(
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
//
// class OrderDeatilsModelVariation {
//   OrderDeatilsModelVariation({
//     required this.color,
//     required this.size,
//   });
//
//   String color;
//   String? size;
//
//   factory OrderDeatilsModelVariation.fromJson(Map<String, dynamic> json) => OrderDeatilsModelVariation(
//     color: json["color"],
//     size: json["size"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "color": color,
//     "size": size,
//   };
// }



// To parse this JSON data, do
//
//     final orderDeatilsModel = orderDeatilsModelFromJson(jsonString);

import 'dart:convert';

List<OrderDeatilsModel> orderDeatilsModelFromJson(String str) => List<OrderDeatilsModel>.from(json.decode(str).map((x) => OrderDeatilsModel.fromJson(x)));

String orderDeatilsModelToJson(List<OrderDeatilsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDeatilsModel {
  OrderDeatilsModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.sellerId,
    required this.productDetails,
    required this.qty,
    required this.price,
    required this.tax,
    required this.discount,
    required this.deliveryStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.shippingMethodId,
    required this.variant,
    required this.variation,
    required this.discountType,
    required this.isStockDecreased,
    required this.refundRequest,
    required this.userEmail,
    required this.userName,
    required this.userContact,
    required this.orderStatus,
    required this.isDirectOrder,
    required this.shippingAddressData,
  });

  int id;
  int orderId;
  int productId;
  int sellerId;
  ProductDetails productDetails;
  int qty;
  int price;
  double tax;
  double discount;
  String deliveryStatus;
  String paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic shippingMethodId;
  String variant;
  OrderDeatilsModelVariation variation;
  String discountType;
  int isStockDecreased;
  int refundRequest;
  String userEmail;
  String userName;
  String userContact;
  String orderStatus;
  int isDirectOrder;
  ShippingAddressData? shippingAddressData;

  factory OrderDeatilsModel.fromJson(Map<String, dynamic> json) => OrderDeatilsModel(
    id: json["id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    sellerId: json["seller_id"],
    productDetails: ProductDetails.fromJson(json["product_details"]),
    qty: json["qty"],
    price: json["price"],
    tax: json["tax"].toDouble(),
    discount: json["discount"].toDouble(),
    deliveryStatus: json["delivery_status"],
    paymentStatus: json["payment_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    shippingMethodId: json["shipping_method_id"],
    variant: json["variant"],
    variation: OrderDeatilsModelVariation.fromJson(json["variation"]),
    discountType: json["discount_type"],
    isStockDecreased: json["is_stock_decreased"],
    refundRequest: json["refund_request"],
    userEmail: json["user_email"],
    userName: json["user_name"],
    userContact: json["user_contact"],
    orderStatus: json["order_status"],
    isDirectOrder: json["is_direct_order"],
    shippingAddressData: json["shipping_address_data"] == null ? null : ShippingAddressData.fromJson(json["shipping_address_data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "product_id": productId,
    "seller_id": sellerId,
    "product_details": productDetails.toJson(),
    "qty": qty,
    "price": price,
    "tax": tax,
    "discount": discount,
    "delivery_status": deliveryStatus,
    "payment_status": paymentStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "shipping_method_id": shippingMethodId,
    "variant": variant,
    "variation": variation.toJson(),
    "discount_type": discountType,
    "is_stock_decreased": isStockDecreased,
    "refund_request": refundRequest,
    "user_email": userEmail,
    "user_name": userName,
    "user_contact": userContact,
    "order_status": orderStatus,
    "is_direct_order": isDirectOrder,
    "shipping_address_data": shippingAddressData!.toJson(),
  };
}

class ProductDetails {
  ProductDetails({
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
  List<VariationElement> variation;
  int published;
  int unitPrice;
  int purchasePrice;
  String priceType;
  int wholesalePrice;
  int tax;
  dynamic taxType;
  int discount;
  dynamic discountType;
  int currentStock;
  String details;
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
  List<dynamic> translations;
  List<dynamic> reviews;

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
    colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
    variantProduct: json["variant_product"],
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
    variation: List<VariationElement>.from(json["variation"].map((x) => VariationElement.fromJson(x))),
    published: json["published"],
    unitPrice: json["unit_price"],
    purchasePrice: json["purchase_price"],
    priceType: json["price_type"],
    wholesalePrice: json["wholesale_price"],
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
    size: json["size"] == null ? null : List<String>.from(json["size"].map((x) => x)),
    subName: json["sub_name"],
    secretPayment: json["secret_payment"],
    sizeFit: json["size_fit"],
    deliveryReturns: json["delivery_returns"],
    reviewsCount: json["reviews_count"],
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
    "size": List<dynamic>.from(size!.map((x) => x)),
    "sub_name": subName,
    "secret_payment": secretPayment,
    "size_fit": sizeFit,
    "delivery_returns": deliveryReturns,
    "reviews_count": reviewsCount,
    "translations": List<dynamic>.from(translations.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
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

class VariationElement {
  VariationElement({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  String type;
  int price;
  String sku;
  int qty;

  factory VariationElement.fromJson(Map<String, dynamic> json) => VariationElement(
    type: json["type"],
    price: json["price"],
    sku: json["sku"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "price": price,
    "sku": sku,
    "qty": qty,
  };
}

class ShippingAddressData {
  ShippingAddressData({
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

  factory ShippingAddressData.fromJson(Map<String, dynamic> json) => ShippingAddressData(
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

class OrderDeatilsModelVariation {
  OrderDeatilsModelVariation({
    required this.color,
  });

  String color;

  factory OrderDeatilsModelVariation.fromJson(Map<String, dynamic> json) => OrderDeatilsModelVariation(
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
  };
}
