import 'Cart/cart.dart';
import 'package:get/get.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Components/AppBarStyle.dart';
import '../Components/TextRichCustom.dart';
import '../GetxController/Cart_controller.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../GetxController/Offers_controller.dart';
import '../GetxController/MyHomePage_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

// import '../Views/HomeBanner.dart';

class Offers extends StatelessWidget {
  Offers({super.key});
  final controller = Get.put(OffersController());
  final homPageController = Get.put(HomeBannerController());

  final cart = Get.put(CartController());
  // final coupon = Get.put(CouponController());
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final homeBanner = Get.put(HomeBannerController());

    // controller.fetchOffers();

    // debugPrint('data===========>${controller.offers[1].couponBanner!}');
    return GetBuilder(
        init: OffersController(),
        initState: controller.initCustom(),
        builder: (_) {
          return Obx(() {
            return Scaffold(
              appBar: AppBarStyle(
                styleTitle: TextStylesCustom.textStyles_20,
                elevation: 0,
                centerTitle: false,
                title: 'Coupons for you',
                backgroundColor: ColorStyle.primaryColorRed,
                leading: IconButton(
                  onPressed: (() => Get.back()),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 20,
                  ),
                  color: Colors.white,
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: ColorStyle.secondryColorBlack.withOpacity(0.7),
                      width: 1,
                    ))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                                controller: controller.coupon.value,
                                decoration: InputDecoration(
                                  hintText: "Coupon...", //hint text
                                  prefixIcon: Image.asset(
                                    'assets/images/Coupon.png',
                                    height: 10,
                                    width: 50,
                                  ), //prefix iocn
                                  hintStyle: TextStylesCustom.textStyles_20
                                      .apply(
                                          color: ColorStyle.secondryColorBlack
                                              .withOpacity(0.5)),
                                )),
                          ),
                        ),
                        FittedBox(
                            child: TextButton(
                          child: Text(
                            'Apply',
                            style: TextStylesCustom.textStyles_14,
                          ),
                          onPressed: () {
                            cart.taxShippingCharges();
                            controller
                                .applyCoupon(controller.coupon.value.text);
                            // FocusScopeNode currentFocus =
                            //     FocusScope.of(context);
                            // if (!currentFocus.hasPrimaryFocus &&
                            //     currentFocus.focusedChild != null) {
                            //   currentFocus.focusedChild?.unfocus();
                            // }
                          },
                        )
                            // ElevatedButtonCustom(
                            //   BgColor: Colors.transparent,
                            //   radiusBorder: 5,
                            //   size: const Size(90, 40),

                            //   text: 'Apply',
                            //   onTap: () {
                            //     cart.taxShippingCharges();
                            //     couponApply.applyCoupon();
                            //     FocusScopeNode currentFocus =
                            //         FocusScope.of(context);
                            //     if (!currentFocus.hasPrimaryFocus &&
                            //         currentFocus.focusedChild != null) {
                            //       currentFocus.focusedChild?.unfocus();
                            //     }
                            //   },
                            // ),
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Available Coupons',
                      style: TextStylesCustom.textStyles_22
                          .apply(fontWeightDelta: 3),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: controller.offers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                // height: 100,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: ColorStyle.white.withOpacity(0.8),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: ColorStyle.white
                                                  .withOpacity(0.8),
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: ColorStyle
                                                      .secondryColorBlack
                                                      .withOpacity(0.3),
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                            ),
                                            child: Text(
                                                controller.offers[index]['code']
                                                    .toString(),
                                                style: TextStylesCustom
                                                    .textStyles_14)),
                                        Text(
                                          "View Details",
                                          style: TextStylesCustom.textStyles_14,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FittedBox(
                                          child: SizedBox(
                                            width: 240,
                                            child: Text(
                                              controller.offers[index]
                                                      ['description']
                                                  .toString(),
                                              style: TextStylesCustom
                                                  .textStyles_12,
                                            ),
                                          ),
                                        ),
                                        ElevatedButtonCustom(
                                          onTap: () async {
                                            await controller.applyCoupon(
                                                controller.offers[index]
                                                    ['code']);
                                            await cart.taxShippingCharges();

                                            await controller.checkOut();
                                            controller.update();
                                            cart.cartDiscount(
                                                controller.checkout[
                                                        'discount_amount'] ??
                                                    0.0);
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Obx((() {
                                                          return AlertDialog(
                                                            content: Text(controller
                                                                        .checkout[
                                                                    'message'] ??
                                                                ''),
                                                            title: Text(
                                                              controller.couponData[
                                                                          'message'] ==
                                                                      null
                                                                  ? ''
                                                                  : controller
                                                                      .couponData[
                                                                          'message']
                                                                      .toString(),

                                                              // couponApply.message.value,
                                                              style: TextStylesCustom
                                                                  .textStyles_13
                                                                  .apply(
                                                                      color: ColorStyle
                                                                          .primaryColorRed),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    const Text(
                                                                        'OK'),
                                                              ),
                                                            ],
                                                          );
                                                        })));
                                          },
                                          text: 'Apply',
                                          size: const Size(100, 20),
                                          radiusBorder: 10,
                                        )
                                      ],
                                    ),
                                  ],
                                ));
                          }),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
