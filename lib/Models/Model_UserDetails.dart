// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.profilePicture,
    this.authProvider,
    this.isActive,
    this.isVerify,
    this.isStaff,
    this.isEmailVerify,
    this.groups,
    this.groupData,
    this.dateJoined,
    this.lastLogin,
  });

  int? id;
  String? email;
  String? password;
  dynamic firstName;
  dynamic lastName;
  dynamic mobileNumber;
  String? profilePicture;
  String? authProvider;
  bool? isActive;
  bool? isVerify;
  bool? isStaff;
  bool? isEmailVerify;
  List<dynamic>? groups;
  List<dynamic>? groupData;
  DateTime? dateJoined;
  DateTime? lastLogin;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobileNumber: json["mobile_number"],
        profilePicture: json["profile_picture"],
        authProvider: json["auth_provider"],
        isActive: json["is_active"],
        isVerify: json["is_verify"],
        isStaff: json["is_staff"],
        isEmailVerify: json["is_email_verify"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        groupData: List<dynamic>.from(json["group_data"].map((x) => x)),
        dateJoined: DateTime.parse(json["date_joined"]),
        lastLogin: DateTime.parse(json["last_login"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "mobile_number": mobileNumber,
        "profile_picture": profilePicture,
        "auth_provider": authProvider,
        "is_active": isActive,
        "is_verify": isVerify,
        "is_staff": isStaff,
        "is_email_verify": isEmailVerify,
        "groups": List<dynamic>.from(groups!.map((x) => x)),
        "group_data": List<dynamic>.from(groupData!.map((x) => x)),
        "date_joined": dateJoined.toString(),
        "last_login": lastLogin.toString(),
      };
}
