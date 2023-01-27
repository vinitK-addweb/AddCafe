import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import '../Models/Model_Cart.dart';
import '../Utils/API.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartController extends GetxController {
  Map cart = {};
  Map tax = {};
  RxList<CartModel> cartData = <CartModel>[].obs;
  Razorpay? _razorpay;

  //action
  initMethod() {
    Future.delayed(const Duration(milliseconds: 1), () {
      fetchCart();
      taxShippingCharges();
    });
  }

  //get api call for cartproduct
  Future fetchCart() async {
    cart = await API.instance.get(endPoint: 'cart/cart-items/', isHeader: true);

    cartData.value =
        List<CartModel>.from(cart['payload'].map((x) => CartModel.fromJson(x)));
  }

  Future taxShippingCharges() async {
    tax = await API.instance
        .get(endPoint: 'order/tax-shipping-charge/', isHeader: true);
  }

  // -------------------- Add to cart functionality ------------------------>>

  Future addToCart(payload) async {
    http.Response response;
    response = await http.post(Uri.parse('${kBaseUrl}cart/add-cart-items/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $kTOKENSAVED'
        },
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;

      fetchCart();
    }
  }
  // <------------------- update item from cart ----------------->

  Future updateQuantity(status, id) async {
    final params = {"quantity": status};
    print('data======== >${params}');
    await API.instance.patch(
        endPoint: 'cart/cart-items/$id/', params: params, isHeader: true);
    fetchCart();
  }

  // <------------------- Delete item from cart ----------------->
  Future delete(id) async {
    final res =
        API.instance.delete(endPoint: 'cart/cart-items/$id/', isHeader: true);

    print(res);

    print('payload datqa >>>>>>>>>>>' + id.toString());

    fetchCart();
  }

  List isInCart(id) {
    List data = cartData;

    print("sa" + id.toString());
    print("data is here" + data.toString());
    var b = data.where((e) => e.itemDetail!.id == id).toList();
    print("dasdadas" + b.toString());
    return b;
  }

  // -------------------- create order for user ---------------------->

}
