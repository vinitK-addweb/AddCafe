// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

List<OffersModel> offersModelFromJson(String str) => List<OffersModel>.from(
    json.decode(str).map((x) => OffersModel.fromJson(x)));

String offersModelToJson(List<OffersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OffersModel {
  OffersModel({
    this.id,
    this.name,
    this.code,
    this.couponBanner,
    this.discountType,
    this.value,
    this.freeShipping,
    this.startDate,
    this.endDate,
    this.minimumCartAmt,
    this.discountUpto,
    this.products,
    this.categories,
    this.limitPerCoupon,
    this.limitPerCustomer,
    this.isActive,
    this.totalUse,
    this.totalDiscount,
    this.termsAndCondition,
    this.description,
    this.productsData,
  });

  int? id;
  String? name;
  String? code;
  String? couponBanner;
  String? discountType;
  double? value;
  bool? freeShipping;
  DateTime? startDate;
  DateTime? endDate;
  double? minimumCartAmt;
  double? discountUpto;
  List<int>? products;
  List<dynamic>? categories;
  int? limitPerCoupon;
  int? limitPerCustomer;
  bool? isActive;
  int? totalUse;
  int? totalDiscount;
  String? termsAndCondition;
  String? description;
  List<ProductsDatum>? productsData;

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        couponBanner: json["coupon_banner"],
        discountType: json["discount_type"],
        value: json["value"],
        freeShipping: json["free_shipping"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        minimumCartAmt: json["minimum_cart_amt"],
        discountUpto: json["discount_upto"],
        products: List<int>.from(json["products"].map((x) => x)),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        limitPerCoupon: json["limit_per_coupon"],
        limitPerCustomer: json["limit_per_customer"],
        isActive: json["is_active"],
        totalUse: json["total_use"],
        totalDiscount: json["total_discount"],
        termsAndCondition: json["terms_and_condition"],
        description: json["description"],
        productsData: List<ProductsDatum>.from(
            json["products_data"].map((x) => ProductsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "coupon_banner": couponBanner,
        "discount_type": discountType,
        "value": value,
        "free_shipping": freeShipping,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "minimum_cart_amt": minimumCartAmt,
        "discount_upto": discountUpto,
        "products": List<dynamic>.from(products!.map((x) => x)),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "limit_per_coupon": limitPerCoupon,
        "limit_per_customer": limitPerCustomer,
        "is_active": isActive,
        "total_use": totalUse,
        "total_discount": totalDiscount,
        "terms_and_condition": termsAndCondition,
        "description": description,
        "products_data":
            List<dynamic>.from(productsData!.map((x) => x.toJson())),
      };
}

class ProductsDatum {
  ProductsDatum({
    this.id,
    this.category,
    this.categoryName,
    this.itemName,
    this.featuredImage,
    this.price,
    this.description,
    this.addon,
    this.addOnData,
    this.slug,
    this.isActive,
    this.orderCompleted,
  });

  int? id;
  int? category;
  String? categoryName;
  String? itemName;
  String? featuredImage;
  double? price;
  String? description;
  List<int>? addon;
  List<AddOnDatum>? addOnData;
  String? slug;
  bool? isActive;
  int? orderCompleted;

  factory ProductsDatum.fromJson(Map<String, dynamic> json) => ProductsDatum(
        id: json["id"],
        category: json["category"],
        categoryName: json["category_name"],
        itemName: json["item_name"],
        featuredImage: json["featured_image"],
        price: json["price"],
        description: json["description"],
        addon: List<int>.from(json["addon"].map((x) => x)),
        addOnData: List<AddOnDatum>.from(
            json["add_on_data"].map((x) => AddOnDatum.fromJson(x))),
        slug: json["slug"],
        isActive: json["is_active"],
        orderCompleted: json["order_completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "category_name": categoryName,
        "item_name": itemName,
        "featured_image": featuredImage,
        "price": price,
        "description": description,
        "addon": List<dynamic>.from(addon!.map((x) => x)),
        "add_on_data": List<dynamic>.from(addOnData!.map((x) => x.toJson())),
        "slug": slug,
        "is_active": isActive,
        "order_completed": orderCompleted,
      };
}

class AddOnDatum {
  AddOnDatum({
    this.id,
    this.addonName,
    this.addonPrice,
  });

  int? id;
  String? addonName;
  double? addonPrice;

  factory AddOnDatum.fromJson(Map<String, dynamic> json) => AddOnDatum(
        id: json["id"],
        addonName: json["addon_name"],
        addonPrice: json["addon_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "addon_name": addonName,
        "addon_price": addonPrice,
      };
}
