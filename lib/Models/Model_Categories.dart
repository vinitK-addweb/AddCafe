// To parse this JSON data, do
//
//     final modelCategories = modelCategoriesFromJson(jsonString);

import 'dart:convert';

List<ModelCategories> modelCategoriesFromJson(String str) =>
    List<ModelCategories>.from(
        json.decode(str).map((x) => ModelCategories.fromJson(x)));

String modelCategoriesToJson(List<ModelCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCategories {
  ModelCategories({
    this.id,
    this.sequence,
    this.name,
    this.productCount,
    this.image,
    this.slug,
    this.isActive,
  });

  int? id;
  int? sequence;
  String? name;
  int? productCount;
  String? image;
  String? slug;
  bool? isActive;

  factory ModelCategories.fromJson(Map<String, dynamic> json) =>
      ModelCategories(
        id: json["id"],
        sequence: json["sequence"],
        name: json["name"],
        productCount: json["product_count"],
        image: json["image"],
        slug: json["slug"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sequence": sequence,
        "name": name,
        "product_count": productCount,
        "image": image,
        "slug": slug,
        "is_active": isActive,
      };
}
