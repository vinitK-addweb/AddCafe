// To parse this JSON data, do
//
//     final userAddressModel = userAddressModelFromJson(jsonString);

import 'dart:convert';

List<UserAddressModel> userAddressModelFromJson(String str) =>
    List<UserAddressModel>.from(
        json.decode(str).map((x) => UserAddressModel.fromJson(x)));

String userAddressModelToJson(List<UserAddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAddressModel {
  UserAddressModel({
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

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      UserAddressModel(
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
