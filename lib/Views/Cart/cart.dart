import 'dart:convert';
import 'address.dart';
import 'dart:developer';
import '../Offers.dart';
import './emptyCart.dart';
import 'package:get/get.dart';
import '../../Utils/API.dart';
import '../OrderDetails.dart';
import '../AddNewAddress.dart';
import '../../Utils/Global.dart';
import '../../Utils/Constant.dart';
import '../../Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:addcafe/BottomNavBar.dart';
import '../../Components/AppBarStyle.dart';
import 'package:addcafe/Styles/TextStyles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../GetxController/Cart_controller.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../../GetxController/Offers_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../GetxController/MyHomePage_controller.dart';
import '../../GetxController/UserProfile_controller.dart';
// import '../../GetxController/Coupon_controller.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(CartController());
  final offer = Get.put(OffersController());
  String dropdownValue = 'Cash';
  Razorpay? _razorpay;

  // <------------------- Razor pay integration ----------------------------------->
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        "Payment Success : ${response.paymentId} order id ->${response.orderId} signature==> ${response.signature} ");
    Fluttertoast.showToast(
        msg: "Payment Success : ${response.paymentId} ", timeInSecForIosWeb: 4);
    final param = {
      "razorpay_payment_id": response.paymentId.toString(),
      "razorpay_order_id": response.orderId.toString(),
      "razorpay_signature": response.signature.toString()
    };

    API.instance
        .post(endPoint: 'order/handle-payment/', params: param, isHeader: true)
        .then((value) => Get.to(OrderDetails()));
    controller.update();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Error here : ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);

    var del = API.instance.delete(
        endPoint: 'order/user-order/${userOrder['payload']['id']}/',
        isHeader: true);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External-wallet is : ${response.walletName} ",
        timeInSecForIosWeb: 4);
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  var discount = 0;
  Map userOrder = {};
  Map orderpayment = {};
  Map checkout = {};

  // ---------------------------coupon checkout function-------------------->>>>>
  checkOut(addressid, double price) async {
    final param = {
      "coupon_id": offer.couponData['payload'] == null
          ? ''
          : offer.couponData['payload']['coupon_id'].toString()
    };

    checkout = await API.instance
        .post(endPoint: 'cart/checkout/', params: param, isHeader: true) as Map;

    submitRequest(addressid, price);
  }

// <------------------------- order create functionality --------------------->>>
  submitRequest(addressid, double price) async {
    final orderCreate = '${kBaseUrl}order/order-create/';
    final param = {
      "address": addressid,
      "order_notes": "(This is Optional Field)",
      "rate_after_discount":
          checkout['total_rate_after_discount'] ?? checkout['total_rate'],
    };

    final url = Uri.parse(orderCreate);

    var paramJSON = jsonEncode(param);
    var header = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $kTOKENSAVED'
    };

    try {
      showLoaderGetX();

      var response = await http.post(url, headers: header, body: paramJSON);

      hideLoader();
      if (response.statusCode == 200) {
        userOrder = json.decode(response.body);
        controller.update();

        dropdownValue == 'Cash' ? Get.to(OrderDetails()) : orderPayment();
      } else {
        'Somthing went wrong'.showError();
      }
    } catch (error) {
      debugPrint('Error is:-$error');
      hideLoader();
      return null;
    }
  }

// <------------------------ Order Payment Functionality ----------------------->
  orderPayment() async {
    final param = {"order_id": userOrder['payload']['id'].toString()};

    orderpayment = await API.instance
        .post(endPoint: 'order/payment/', params: param, isHeader: true) as Map;

    makePayment();
  }

// <----------------------- Make Payment on Razor pay functionality ------------>
  void makePayment() async {
    var options = {
      'key': orderpayment['payload']['razor_key'].toString(),
      'amount': orderpayment['payload']['amount'],
      'name': orderpayment['payload']['name'].toString(),
      "order_id": orderpayment['payload']['id'].toString(),
      'description': 'testing purpose',
      'prefill': {
        'contact': '+${orderpayment['payload']['contact']}',
        'email': orderpayment['payload']['email'].toString(),
      },
    };
    try {
      log(options.toString());
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Get.put(UserProfileController());

    return GetBuilder(
        init: controller,
        initState: (_) {
          controller.initMethod();
        },
        builder: (_) {
          return Obx(() {
            return Scaffold(
              backgroundColor: Colors.white70.withOpacity(0.9),
              key: scaffoldKey,
              appBar: AppBarStyle(
                styleTitle: TextStylesCustom.textStyles_20,
                elevation: 0,
                title: 'Cart',
                backgroundColor: ColorStyle.primaryColorRed,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              bottomNavigationBar: controller.cartData.isEmpty
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButtonCustom(
                        BgColor: ColorStyle.primaryColorRed,
                        size: Size(MediaQuery.of(context).size.width, 50),
                        text: 'Add Items',
                        onTap: () {
                          Get.to(BottamNavigationBar());
                        },
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 4.8,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          userProfile.addAddress.isEmpty
                              ? TextButton(
                                  onPressed: () {
                                    Get.to(() => AddNewAddress());
                                  },
                                  child: const Text('Add Address'),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Icon(
                                              Icons.location_on,
                                              color: ColorStyle.primaryColorRed,
                                              size: 21,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: 'Delviery at ',
                                                  style: TextStylesCustom
                                                      .textStyles_18
                                                      .apply(
                                                          color: ColorStyle
                                                              .secondryColorBlack),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: userProfile
                                                          .addAddress[
                                                              userProfile
                                                                  .address
                                                                  .value]
                                                          .addressType,
                                                      style: TextStylesCustom
                                                          .textStyles_18
                                                          .apply(
                                                              fontWeightDelta:
                                                                  3),
                                                    )
                                                  ]),
                                            )
                                          ]),
                                          InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                context: context,
                                                builder: (context) => Address(),
                                              );
                                            },
                                            child: Text("Change",
                                                style: TextStylesCustom
                                                    .textStyles_15
                                                    .apply(
                                                        color: ColorStyle
                                                            .secondryColorRed)),
                                          ),
                                        ],
                                      ),
                                      FittedBox(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          width: 310.0,
                                          child: Text(
                                            '${userProfile.addAddress[userProfile.address.value].buildingNumName},${userProfile.addAddress[userProfile.address.value].areaColony},${userProfile.addAddress[userProfile.address.value].landmark},${userProfile.addAddress[userProfile.address.value].city},${userProfile.addAddress[userProfile.address.value].state},${userProfile.addAddress[userProfile.address.value].pincode}',
                                            style:
                                                TextStylesCustom.textStyles_13,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                          FittedBox(
                            child: Row(
                              children: [
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  items: <String>['Cash', 'Online']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButtonCustom(
                                  radiusBorder: 10,
                                  BgColor: ColorStyle.primaryColorRed,
                                  size: Size(
                                      MediaQuery.of(context).size.width / 1.6,
                                      40),
                                  text: 'Proceed to checkout',
                                  onTap: () {
                                    // total = controller.cart['total_rate'];
                                    // +
                                    // 20 +
                                    // 27.00;
                                    checkOut(
                                        userProfile
                                            .addAddress[
                                                userProfile.address.value]
                                            .id,
                                        controller.total.value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              body: SingleChildScrollView(
                child: controller.cartData.isEmpty
                    ? const EmptyCart()
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(checkout['total_rate_after_discount'] == null
                            //     ? checkout['total_rate'].toString()
                            //     : checkout['total_rate_after_discount']
                            //         .toString()),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Card(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 3,
                                          height: 20,
                                          color: Colors.red,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'Your Order',
                                              style: TextStylesCustom
                                                  .textStyles_20
                                                  .apply(fontWeightDelta: 3),
                                            ))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...controller.cartData.map(
                                          (e) {
                                            return Container(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      kImgUrl +
                                                          e.itemDetail!
                                                              .featuredImage
                                                              .toString(),
                                                      height: 90.0,
                                                      width: 90.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            e.itemDetail!
                                                                .itemName
                                                                .toString(),
                                                            style: TextStylesCustom
                                                                .textStyles_15
                                                                .apply(
                                                                    fontWeightDelta:
                                                                        1),
                                                          ),
                                                          ...e.addedAddon!
                                                              .map((addon) =>
                                                                  Text(
                                                                    '${addon.addonName}  ${addon.addonPrice}',
                                                                    style: TextStylesCustom
                                                                        .textStyles_15,
                                                                  ))
                                                              .toList(),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          Text(
                                                            '₹ ${e.itemDetail!.price}',
                                                            style: TextStylesCustom
                                                                .textStyles_15
                                                                .apply(
                                                                    fontWeightDelta:
                                                                        2),
                                                          )
                                                        ]),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: 70,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.red),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    (Radius
                                                                        .circular(
                                                                            8)))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                e.itemCount == 1
                                                                    ? controller
                                                                        .delete(e
                                                                            .id)
                                                                    : controller
                                                                        .updateQuantity(
                                                                            'minus',
                                                                            e.id);
                                                              },
                                                              child: SizedBox(
                                                                width: 20,
                                                                child: Center(
                                                                    child: Text(
                                                                        '-',
                                                                        style: TextStylesCustom
                                                                            .textStyles_20
                                                                            .apply(color: ColorStyle.primaryColorRed))),
                                                              ),
                                                            ),
                                                            Text(
                                                                '${e.itemCount}'),
                                                            InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .updateQuantity(
                                                                          'plus',
                                                                          e.id);
                                                                },
                                                                child: SizedBox(
                                                                  width: 20,
                                                                  child: Center(
                                                                    child: Text(
                                                                        '+',
                                                                        style: TextStylesCustom
                                                                            .textStyles_20
                                                                            .apply(color: ColorStyle.primaryColorRed)),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text('₹ ${e.totalPrice}')
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                'Add more items',
                                                style: TextStylesCustom
                                                    .textStyles_19
                                                    .apply(),
                                              )),
                                        )
                                      ],
                                    )
                                  ]),
                                ),
                              ),
                            ),

                            // Container(
                            //   margin: const EdgeInsets.symmetric(horizontal: 20),
                            //   child:
                            InkWell(
                              onTap: (() => Get.to(() => Offers())),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  decoration: const BoxDecoration(
                                      // border: Border()
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ImageIcon(
                                            const AssetImage(
                                                'assets/images/Coupon.png'),
                                            size: 25,
                                            color: ColorStyle.secondryColorRed,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Use Coupon',
                                            style: TextStylesCustom
                                                .textStyles_20
                                                .apply(fontWeightDelta: 3),
                                          ),
                                        ],
                                      ),

                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                      )
                                      // )
                                    ],
                                  )),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            Card(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 3,
                                        height: 20,
                                        color: Colors.red,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Bill Summary',
                                            style: TextStylesCustom
                                                .textStyles_20
                                                .apply(fontWeightDelta: 2),
                                          ))
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Item Total',
                                              style: TextStylesCustom
                                                  .textStyles_14,
                                            ),
                                            Text(
                                              '₹ ${controller.cart['total_rate']}',
                                              style: TextStylesCustom
                                                  .textStyles_14,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.tax['delivery'][0]
                                                  ['label'],
                                              style: TextStylesCustom
                                                  .textStyles_14
                                                  .apply(
                                                      fontWeightDelta: 3,
                                                      color: Colors.blue),
                                            ),
                                            Text(
                                              '₹ ${controller.tax['delivery'][0]['cost']}',
                                              style: TextStylesCustom
                                                  .textStyles_14
                                                  .apply(
                                                      fontWeightDelta: 3,
                                                      color: Colors.blue),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.tax['tax'][0]
                                                  ['tax_name'],
                                              style: TextStylesCustom
                                                  .textStyles_14
                                                  .apply(color: Colors.grey),
                                            ),
                                            Text(
                                                ' ${controller.tax['tax'][0]['percentage']} %',
                                                style: TextStylesCustom
                                                    .textStyles_14
                                                    .apply(color: Colors.grey))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Coupon',
                                            style: TextStylesCustom
                                                .textStyles_14
                                                .apply(
                                                    color: ColorStyle
                                                        .secondryColorBlack
                                                        .withOpacity(0.7)),
                                          ),
                                          Text('₹ -${controller.discount}',
                                              style: TextStylesCustom
                                                  .textStyles_14
                                                  .apply(
                                                      color: ColorStyle
                                                          .secondryColorBlack
                                                          .withOpacity(0.7)))
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Grand Total',
                                              style: TextStylesCustom
                                                  .textStyles_18
                                                  .apply(fontWeightDelta: 3),
                                            ),
                                            Obx(() => Text(
                                                  '₹ ${controller.totalAmount()}',
                                                  style: TextStylesCustom
                                                      .textStyles_18
                                                      .apply(
                                                          fontWeightDelta: 3),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // ),
                                ]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              decoration: const BoxDecoration(
                                  // border: Border()
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Cancellation",
                                      style: TextStylesCustom.textStyles_14
                                          .apply(fontWeightDelta: 3),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "100% cancellation fee will be applicable if you decide to cancel the order anytime after order placement. Avoid cancellation as it leads to food wastage",
                                      style: TextStylesCustom.textStyles_12,
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                // ])
              ),
            );
          });
        });
  }
}
