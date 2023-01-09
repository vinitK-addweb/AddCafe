// To parse this JSON data, do
//
//     final modelFaq = modelFaqFromJson(jsonString);

import 'dart:convert';

List<ModelFaq> modelFaqFromJson(String str) =>
    List<ModelFaq>.from(json.decode(str).map((x) => ModelFaq.fromJson(x)));

String modelFaqToJson(List<ModelFaq> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelFaq {
  ModelFaq({
    this.id,
    this.question,
    this.answer,
  });

  int? id;
  String? question;
  String? answer;

  factory ModelFaq.fromJson(Map<String, dynamic> json) => ModelFaq(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}
