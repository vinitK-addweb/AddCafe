// To parse this JSON data, do
//
//     final userAddressModel = userAddressModelFromJson(jsonString);

import 'dart:convert';

UserAddressModel userAddressModelFromJson(String str) =>
    UserAddressModel.fromJson(json.decode(str));

String userAddressModelToJson(UserAddressModel data) =>
    json.encode(data.toJson());

class UserAddressModel {
  UserAddressModel({
    this.status,
    this.count,
    this.payload,
  });

  int? status;
  int? count;
  List<Payload>? payload;

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      UserAddressModel(
        status: json["status"],
        count: json["count"],
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  Payload({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.fullName,
    this.phoneNum,
    this.buildingNumName,
    this.areaColony,
    this.landmark,
    this.pincode,
    this.city,
    this.state,
    this.addressType,
    this.user,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDeleted;
  String? fullName;
  String? phoneNum;
  String? buildingNumName;
  String? areaColony;
  String? landmark;
  int? pincode;
  String? city;
  String? state;
  String? addressType;
  int? user;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"],
        fullName: json["full_name"],
        phoneNum: json["phone_num"],
        buildingNumName: json["building_num_name"],
        areaColony: json["area_colony"],
        landmark: json["landmark"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
        addressType: json["address_type"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "is_deleted": isDeleted,
        "full_name": fullName,
        "phone_num": phoneNum,
        "building_num_name": buildingNumName,
        "area_colony": areaColony,
        "landmark": landmark,
        "pincode": pincode,
        "city": city,
        "state": state,
        "address_type": addressType,
        "user": user,
      };
}
