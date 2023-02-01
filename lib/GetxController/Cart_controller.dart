import 'dart:convert';
import 'dart:developer';
import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import '../Utils/Constant.dart';
import './Offers_controller.dart';
import '../Models/Model_Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartController extends GetxController {
  Map cart = {};
  Map tax = {};
  RxList<CartModel> cartData = <CartModel>[].obs;
  Razorpay? _razorpay;
  RxDouble discount = 0.0.obs;
  RxDouble grandTotal = 0.0.obs;
  RxDouble total = 0.0.obs;

  //action
  initMethod() {
    Future.delayed(const Duration(milliseconds: 1), () {
      fetchCart();
      taxShippingCharges();
      totalAmount();
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
    log('taxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' + tax.toString());
  }

  cartDiscount(value) {
    discount.value = value;
    total.value - discount.value;
    // grandTotal.value =
  }

  totalAmount() {
    total.value = cart['total_rate'] +
        (cart['total_rate'] / 100) * tax['tax'][0]['percentage'] +
        tax['delivery'][0]['cost'] -
        discount.value;
    total.value = total.value.toPrecision(2);
    return total.value;
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
}
