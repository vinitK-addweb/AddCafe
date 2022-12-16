import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import '../Models/Model_Cart.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';

class CartController extends GetxController {
  Map cart = {};
  RxList<CartModel> cartData = <CartModel>[].obs;
  List data = [];
  // getter
  // Map get cart {
  //   return _cart;
  // }

  // List get cartData {
  //   return _cartData;
  // }

  //action
  initMethod() {
    Future.delayed(const Duration(milliseconds: 1), () {
      fetchCart();
    });
  }

  //get api call for cartproduct
  Future fetchCart() async {
    cart = await API.instance.get(endPoint: 'cart/cart-items/', isHeader: true);
    // data = cart as List;

    cartData.value =
        List<CartModel>.from(cart['payload'].map((x) => CartModel.fromJson(x)));
    // if (cart['message']) {
    //   ' ${cart['message']}'.showSuccess();
    // }
  }

  Future addToCart(payload) async {
    print('payload datqa >>>>>>>>>>>' + payload.toString());
    http.Response response;
    response = await http.post(
        Uri.parse(
            'https://cafe.addwebprojects.com/api/v1/cart/add-cart-items/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
        },
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      // print(data['message'].toString());
      '${data['message']}'.showSuccess();
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

    // http.Response response;
    // response = await http.patch(
    //     Uri.parse(
    //         'https://cafe.addwebprojects.com/api/v1/cart/cart-items/${id}/'),
    //     headers: {
    //       "Content-Type": "application/json",
    //       "Authorization":
    //           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0MDQwNjQ1LCJpYXQiOjE2NjU0MDA2NDUsImp0aSI6ImI0NDM0M2M3MDMyYTRhMWZiNzczNzAyZTJhMDkzYzMwIiwidXNlcl9pZCI6MX0.Hs1B5pTqMfP7h5DJT4JFI31Ze6gmeJgNCExVNCvEswo'
    //     },
    //     body: jsonEncode({"quantity": status}));
    // if (response.statusCode == 200) {
    //   fetchCart();
    // } else {}
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
    // List data = cartData;
    // fetchCart();
    print("sa" + id.toString());
    print("data is here" + data.toString());
    var b = data.where((e) => e['item'] == id).toList();
    print("dasdadas" + b.toString());
    return b;
    // print("data is " + data[0].toString());
    // return data;
  }
}
