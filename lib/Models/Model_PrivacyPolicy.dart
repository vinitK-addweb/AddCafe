// To parse this JSON data, do
//
//     final privacyPolicy = privacyPolicyFromJson(jsonString);

import 'dart:convert';

List<PrivacyPolicy> privacyPolicyFromJson(String str) =>
    List<PrivacyPolicy>.from(
        json.decode(str).map((x) => PrivacyPolicy.fromJson(x)));

String privacyPolicyToJson(List<PrivacyPolicy> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrivacyPolicy {
  PrivacyPolicy({
    this.id,
    this.pAndP,
  });

  int? id;
  String? pAndP;

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) => PrivacyPolicy(
        id: json["id"],
        pAndP: json["p_and_p"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "p_and_p": pAndP,
      };
}
