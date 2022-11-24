// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'dart:convert';

List<Wishlist> wishlistFromJson(String str) =>
    List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

String wishlistToJson(List<Wishlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wishlist {
  Wishlist({
    this.id,
    this.user,
    this.product,
    this.productData,
  });

  int? id;
  int? user;
  int? product;
  ProductData? productData;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        user: json["user"],
        product: json["product"],
        productData: ProductData.fromJson(json["product_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "product": product,
        "product_data": productData?.toJson(),
      };
}

class ProductData {
  ProductData({
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

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
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
