// To parse this JSON data, do
//
//     final modelActiveProducts = modelActiveProductsFromJson(jsonString);

import 'dart:convert';

List<ModelActiveProducts> modelActiveProductsFromJson(String str) =>
    List<ModelActiveProducts>.from(
        json.decode(str).map((x) => ModelActiveProducts.fromJson(x)));

String modelActiveProductsToJson(List<ModelActiveProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelActiveProducts {
  ModelActiveProducts({
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

  factory ModelActiveProducts.fromJson(Map<String, dynamic> json) =>
      ModelActiveProducts(
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
