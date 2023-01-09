import 'dart:ui';

import 'package:addcafe/BottomNavBar.dart';
import 'package:addcafe/Styles/TextStyles.dart';
import 'package:addcafe/Views/AddNewAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../GetxController/Coupon_controller.dart';
import '../../GetxController/UserProfile_controller.dart';
import '../Offers.dart';
import './emptyCart.dart';
import '../../Styles/ColorStyle.dart';
import '../../GetxController/Cart_controller.dart';
import '../../GetxController/MyHomePage_controller.dart';
import '../../Components/AppBarStyle.dart';
import '../../Utils/Constant.dart';
import '../../Components/ElevatedButtonCustom.dart';
import 'address.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Razorpay? _razorpay;
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Success : ${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Error here : ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
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

  var total;
  void makePayment() async {
    var options = {
      'key': 'rzp_test_u0UCMR2fWYdz4P',
      'amount': total * 100,
      'name': 'test',
      'description': 'testing purpose',
      'prefill': {
        'contact': '+91-9999988888',
        'email': 'test@gmail.com',
      },
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final homPageController = Get.put(HomeBannerController());
    final userProfile = Get.put(UserProfileController());
    final couponApply = Get.put(CouponController());

    return GetBuilder(
        init: controller,
        initState: (_) => controller.initMethod(),
        builder: (controller) {
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
                  // currentIndex.value = 0,
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
                        text:
                            // controller.cartData.isNotEmpty
                            //     ? 'Proceed to checkout'
                            // :
                            'Add Items',
                        onTap: () {
                          // controller.cartData.isNotEmpty
                          // ? Get.to(AddNewAddress())
                          // :
                          Get.to(BottamNavigationBar());
                        },
                      ),
                    )
                  : Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card(
                          //   child:

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      style: TextStylesCustom.textStyles_18
                                          .apply(
                                              color: ColorStyle
                                                  .secondryColorBlack),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: userProfile
                                              .addAddress[
                                                  userProfile.address.value]
                                              .addressType,
                                          style: TextStylesCustom.textStyles_18
                                              .apply(fontWeightDelta: 3),
                                        )
                                      ]),
                                )
                              ]),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20))),
                                    context: context,
                                    builder: (context) => Address(),
                                  );
                                },
                                child: Text("Change",
                                    style: TextStylesCustom.textStyles_15.apply(
                                        color: ColorStyle.secondryColorRed)),
                              ),
                            ],
                          ),
                          FittedBox(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              width: 210.0,
                              child: Text(
                                '${userProfile.addAddress[userProfile.address.value].buildingNumName},${userProfile.addAddress[userProfile.address.value].areaColony},${userProfile.addAddress[userProfile.address.value].landmark},${userProfile.addAddress[userProfile.address.value].city},${userProfile.addAddress[userProfile.address.value].state},${userProfile.addAddress[userProfile.address.value].pincode}',
                                style: TextStylesCustom.textStyles_13,
                              ),
                            ),
                          ),

                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButtonCustom(
                            BgColor: ColorStyle.primaryColorRed,
                            size: Size(MediaQuery.of(context).size.width, 50),
                            text:
                                // controller.cartData.isNotEmpty
                                //     ?
                                'Proceed to checkout',
                            // : 'Add Items',
                            onTap: () {
                              total =
                                  controller.cart['total_rate'] + 20 + 27.00;
                              makePayment();
                              // controller.cartData.isNotEmpty
                              //     ?
                              // Get.to(AddNewAddress());
                              // : Get.to(BottomNavBarCustom());
                            },
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
                            // Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [

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
                                                                // if (e.itemCount ==
                                                                //     1) {
                                                                //   controller
                                                                //       .delete(
                                                                //           e.id);
                                                                //   return;
                                                                // }
                                                                // controller
                                                                //     .updateQuantity(
                                                                //         'minus',
                                                                //         e.id);
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
                            // Container(
                            //   margin:
                            //       const EdgeInsets.symmetric(horizontal: 10),
                            //   decoration: BoxDecoration(
                            //       border: Border(
                            //           bottom: BorderSide(
                            //     color: ColorStyle.secondryColorBlack
                            //         .withOpacity(0.7),
                            //     width: 1,
                            //   ))),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: TextField(
                            //             controller: couponApply.coupon.value,
                            //             decoration: InputDecoration(
                            //               hintText: "Coupon...", //hint text
                            //               prefixIcon: Image.asset(
                            //                 'assets/images/Coupon.png',
                            //                 height: 10,
                            //                 width: 50,
                            //               ), //prefix iocn
                            //               hintStyle: TextStylesCustom
                            //                   .textStyles_20
                            //                   .apply(
                            //                       color: ColorStyle
                            //                           .secondryColorBlack
                            //                           .withOpacity(0.5)),
                            //             )),
                            //       ),
                            //       FittedBox(
                            //         child: ElevatedButtonCustom(
                            //           BgColor: ColorStyle.primaryColorRed,
                            //           radiusBorder: 5,
                            //           size: const Size(90, 40),
                            //           text: 'Apply',
                            //           onTap: () {
                            //             controller.taxShippingCharges();
                            //             couponApply.applyCoupon();
                            //             FocusScopeNode currentFocus =
                            //                 FocusScope.of(context);
                            //             if (!currentFocus.hasPrimaryFocus &&
                            //                 currentFocus.focusedChild != null) {
                            //               currentFocus.focusedChild?.unfocus();
                            //             }
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // ),
                            // Text(
                            //   couponApply.response['message'] != null
                            //       ? couponApply.response['message'].toString()
                            //       : '',
                            //   // couponApply.message.value,
                            //   style: TextStylesCustom.textStyles_13
                            //       .apply(color: ColorStyle.primaryColorRed),
                            // ),

                            const SizedBox(
                              height: 10,
                            ),
                            // margin: EdgeInsets.symmetric(vertical: 5),
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
                                  // Container(
                                  //   padding: const EdgeInsets.only(left: 10),
                                  // child:
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
                                                '₹ ${(controller.tax['tax'][0]['percentage'] / 100) * controller.cart['total_rate']}',

                                                // controller.cart['total_rate'] % controller.tax['tax'][0]['percentage']}',
                                                style: TextStylesCustom
                                                    .textStyles_14
                                                    .apply(color: Colors.grey))
                                          ],
                                        ),
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
                                            Text(
                                              '₹ ${controller.cart['total_rate'] + (controller.tax['tax'][0]['percentage'] / 100) * controller.cart['total_rate'] + controller.tax['delivery'][0]['cost']}',
                                              style: TextStylesCustom
                                                  .textStyles_18
                                                  .apply(fontWeightDelta: 3),
                                            )
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
