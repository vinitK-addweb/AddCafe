// To parse this JSON data, do
//
//     final homeCategory = homeCategoryFromJson(jsonString);

import 'package:addcafe/Views/CustomerReviews.dart';

class ModelHomeCategory {
  ModelHomeCategory({
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

  factory ModelHomeCategory.fromJson(Map<String, dynamic> json) =>
      ModelHomeCategory(
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

//............................home banner model......................

// To parse this JSON data, do
//
//     final modelHomeBanner = modelHomeBannerFromJson(jsonString);

// List<ModelHomeBanner> modelHomeBannerFromJson(String str) =>
//     List<ModelHomeBanner>.from(
//         json.decode(str).map((x) => ModelHomeBanner.fromJson(x)));

// String modelHomeBannerToJson(List<ModelHomeBanner> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelHomeBanner {
  ModelHomeBanner({
    this.id,
    this.image,
    this.name,
    this.price,
  });

  String? id;
  String? image;
  String? name;
  String? price;

  factory ModelHomeBanner.fromJson(Map<String, dynamic> json) =>
      ModelHomeBanner(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
      };
}

// ..............................................CustomerReviewsModel.................

// To parse this JSON data, do
//
//     final modelCustomerReviews = modelCustomerReviewsFromJson(jsonString);

// List<ModelCustomerReviews> modelCustomerReviewsFromJson(String str) => List<ModelCustomerReviews>.from(json.decode(str).map((x) => ModelCustomerReviews.fromJson(x)));

// String modelCustomerReviewsToJson(List<ModelCustomerReviews> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCustomerReviews {
  ModelCustomerReviews({
    this.name,
    this.extra,
    this.image,
    this.comment,
    this.date,
  });

  String? name;
  String? extra;
  String? image;
  String? comment;
  String? date;

  factory ModelCustomerReviews.fromJson(Map<String, dynamic> json) =>
      ModelCustomerReviews(
        name: json["name"],
        extra: json["extra"],
        image: json["image"],
        comment: json["comment"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "extra": extra,
        "image": image,
        "comment": comment,
        "date": date,
      };
}
