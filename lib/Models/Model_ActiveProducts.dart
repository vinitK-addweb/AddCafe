// To parse this JSON data, do
//
//     final modelActiveProducts = modelActiveProductsFromJson(jsonString);

import 'dart:convert';

// ModelActiveProducts modelActiveProductsFromJson(String str) =>
//     ModelActiveProducts.fromJson(json.decode(str));

// String modelActiveProductsToJson(ModelActiveProducts data) =>
//     json.encode(data.toJson());

class ModelActiveProducts {
  ModelActiveProducts({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory ModelActiveProducts.fromJson(Map<String, dynamic> json) =>
      ModelActiveProducts(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
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
  int? price;
  String? description;
  List<int>? addon;
  List<AddOnDatum>? addOnData;
  String? slug;
  bool? isActive;
  int? orderCompleted;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
  int? addonPrice;

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
