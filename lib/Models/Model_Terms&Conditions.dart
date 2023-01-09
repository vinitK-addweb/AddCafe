// To parse this JSON data, do
//
//     final termsCondtionsModel = termsCondtionsModelFromJson(jsonString);

import 'dart:convert';

List<TermsCondtionsModel> termsCondtionsModelFromJson(String str) =>
    List<TermsCondtionsModel>.from(
        json.decode(str).map((x) => TermsCondtionsModel.fromJson(x)));

String termsCondtionsModelToJson(List<TermsCondtionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TermsCondtionsModel {
  TermsCondtionsModel({
    this.id,
    this.tAndC,
  });

  int? id;
  String? tAndC;

  factory TermsCondtionsModel.fromJson(Map<String, dynamic> json) =>
      TermsCondtionsModel(
        id: json["id"],
        tAndC: json["t_and_c"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "t_and_c": tAndC,
      };
}
