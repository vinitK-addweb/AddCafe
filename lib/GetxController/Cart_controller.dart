
import 'dart:convert';
import 'dart:developer';

import '../Utils/API.dart';
import 'package:get/get.dart';
import '../Utils/Constant.dart';
import '../Models/Model_Cart.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'UserProfile_controller.dart';

class CartController extends GetxController {
  Map cart = {};
  Map tax = {};
  RxDouble taxAmount = 0.0.obs;
  RxList<CartModel> cartData = <CartModel>[].obs;

  RxDouble discount = 0.0.obs;
  RxDouble grandTotal = 0.0.obs;
  RxDouble total = 0.0.obs;
  RxString walletAmount= "".obs;
  RxBool useWallet = false.obs;
RxDouble totaltax = 0.0.obs;
  initMethod() {
    Future.delayed(const Duration(milliseconds: 1), () {
      if(Get.isRegistered<UserProfileController>() !=false){
        walletAmount.value = Get.find<UserProfileController>().wallet.value;
      }
      fetchCart();
      taxShippingCharges();
      totalAmount();
    });
  }

  Future fetchCart() async {
    cart = await API.instance.get(endPoint: 'cart/cart-items/', isHeader: true);

    cartData.value =
        List<CartModel>.from(cart['payload'].map((x) => CartModel.fromJson(x)));
    update();
  }

   taxShippingCharges() async {
    log("tax details" );
    tax = await API.instance
        .get(endPoint: 'order/tax-shipping-charge/', isHeader: true);
log("length "+tax["tax"].toString());
if(taxAmount == 0.0)
    for(int i = 0; i< tax["tax"].length;i++){
      taxAmount.value =   taxAmount.value+ tax['tax'][i]["percentage"];

    }
    ;
  }

  cartDiscount(value) {
    discount.value = value;
    total.value - discount.value;
  }

  totalAmount() {
    // var gst = ((cart['total_rate'] - discount.value) / 100) *
    //     tax['tax'][0]['percentage'];
    // total.value =
    //     cart['total_rate'] + gst + tax['delivery'][0]['cost'] - discount.value;
    // total.value = total.value.toPrecision(2);

    return (totaltax.value + cart['total_rate']).toStringAsFixed(2);
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

    await API.instance.patch(
        endPoint: 'cart/cart-items/$id/', params: params, isHeader: true);
    fetchCart();
  }
  // <------------------------------ update Addons ------------------------------->
  Future updateAddons(status, id) async {
    final params = {"quantity": status};
log("id====>>"+id.toString());
    await API.instance.patch(
        endPoint: 'cart/cart-items-addon/$id/', params: params, isHeader: true);
    fetchCart();
  }

  // <------------------- Delete item from cart ----------------->
  Future delete(id) async {
    log("run");
   var response = await  API.instance.delete(endPoint: 'cart/cart-items-addon/$id/', isHeader: true);
    log("response=>>>>>${response}");
    fetchCart();
  }

  // <------------------- Delete Add on data----------------->

  Future deleteAddon(id) async {
    var response = await  API.instance.delete(endPoint: 'cart/cart-items-addon/$id/', isHeader: true);
    log("response=>>>>>${response}");
    fetchCart();
  }


  Future deleteItem(id) async {
    API.instance.delete(endPoint: 'cart/cart-items/$id/', isHeader: true);

    fetchCart();
  }

  List isInCart(id) {
    List data = cartData;
    var b = data.where((e) => e.itemDetail!.id == id).toList();
    return b;
  }
  taxCount(amount){
     totaltax.value =
    (amount*taxAmount.value)/100;
    return totaltax;
  }
}
