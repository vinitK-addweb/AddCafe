// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    this.id,
    this.user,
    this.item,
    this.itemDetail,
    this.addedAddon,
    this.rate,
    this.itemCount,
    this.totalPrice,
  });

  int? id;
  int? user;
  int? item;
  ItemDetail? itemDetail;
  List<AddedAddon>? addedAddon;
  double? rate;
  int? itemCount;
  double? totalPrice;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        user: json["user"],
        item: json["item"],
        itemDetail: ItemDetail.fromJson(json["item_detail"]),
        addedAddon: List<AddedAddon>.from(
            json["added_addon"].map((x) => AddedAddon.fromJson(x))),
        rate: json["rate"],
        itemCount: json["item_count"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "item": item,
        "item_detail": itemDetail!.toJson(),
        "added_addon": List<dynamic>.from(addedAddon!.map((x) => x.toJson())),
        "rate": rate,
        "item_count": itemCount,
        "total_price": totalPrice,
      };
}

class AddedAddon {
  AddedAddon({
    this.itemAddon,
    this.addonName,
    this.addonPrice,
  });

  int? itemAddon;
  String? addonName;
  double? addonPrice;

  factory AddedAddon.fromJson(Map<String, dynamic> json) => AddedAddon(
        itemAddon: json["item_addon"],
        addonName: json["addon_name"],
        addonPrice: json["addon_price"],
      );

  Map<String, dynamic> toJson() => {
        "item_addon": itemAddon,
        "addon_name": addonName,
        "addon_price": addonPrice,
      };
}

class ItemDetail {
  ItemDetail({
    this.id,
    this.itemName,
    this.featuredImage,
    this.price,
    this.description,
  });

  int? id;
  String? itemName;
  String? featuredImage;
  double? price;
  String? description;

  factory ItemDetail.fromJson(Map<String, dynamic> json) => ItemDetail(
        id: json["id"],
        itemName: json["item_name"],
        featuredImage: json["featured_image"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_name": itemName,
        "featured_image": featuredImage,
        "price": price,
        "description": description,
      };
}
