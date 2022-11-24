// To parse this JSON data, do
//
//     final modelBanner = modelBannerFromJson(jsonString);

import 'dart:convert';

List<ModelBanner> modelBannerFromJson(String str) => List<ModelBanner>.from(
    json.decode(str).map((x) => ModelBanner.fromJson(x)));

String modelBannerToJson(List<ModelBanner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBanner {
  ModelBanner({
    this.id,
    this.sequence,
    this.bannerTitle,
    this.image,
    this.isActive,
  });

  int? id;
  int? sequence;
  String? bannerTitle;
  String? image;
  bool? isActive;

  factory ModelBanner.fromJson(Map<String, dynamic> json) => ModelBanner(
        id: json["id"],
        sequence: json["sequence"],
        bannerTitle: json["banner_title"],
        image: json["image"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sequence": sequence,
        "banner_title": bannerTitle,
        "image": image,
        "is_active": isActive,
      };
}
