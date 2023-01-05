import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../Components/TextRichCustom.dart';
// import '../Views/HomeBanner.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../GetxController/Offers_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Offers extends StatelessWidget {
  Offers({super.key});
  final controller = Get.put(OffersController());
  final homPageController = Get.put(HomeBannerController());
  @override
  Widget build(BuildContext context) {
    // final homeBanner = Get.put(HomeBannerController());

    // controller.fetchOffers();

    // debugPrint('data===========>${controller.offers[1].couponBanner!}');
    return GetBuilder(
        init: OffersController(),
        initState: controller.initCustom(),
        builder: (controller) {
          return Obx(() {
            return Scaffold(
              appBar: AppBarStyle(
                styleTitle: TextStylesCustom.textStyles_20,
                elevation: 0,
                title: 'Offers',
                backgroundColor: ColorStyle.primaryColorRed,
                leading: IconButton(
                  onPressed: (() => homPageController.currentIndex.value = 0),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ),
              body: controller.offers.isNotEmpty
                  ? Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 130.0, autoPlay: false,
                              // enlargeCenterPage: true,
                            ),
                            items: controller.offers.map((i) {
                              var index = controller.offers.indexOf(i);
                              return Builder(
                                builder: (BuildContext context) {
                                  return InkWell(
                                    onTap: () {
                                      controller.bannerIdx(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(i.couponBanner!),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),

                          // HomeBanner(
                          //   bannerData: homeBanner.bannerData.value,
                          //   autoplay: false,
                          // ),

                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chinese BOGO Week is here.',
                                    style: TextStylesCustom.textStyles_18
                                        .apply(fontWeightDelta: 3),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Terms and Conditions',
                                    style: TextStylesCustom.textStyles_20.apply(
                                        color: ColorStyle.secondryColorRed),
                                  ),
                                  Text(
                                    controller.offers[controller.idx.value]
                                        .termsAndCondition
                                        .toString(),
                                    // 'To redeem the coupon code, the claimant types the coupon code into the promotional box in the booking field of the Quovai\'s websites and the relevant discount will be automatically deducted from the final price of the qualifying purchase. If the claimant fails to enter the coupon code at the time of purchase as specified, the purchase will not be eligible for the discount. Discounts may not be claimed after confirmation of a claimant\'s purchase',
                                    style: TextStylesCustom.textStyles_16,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      TextRichCustom(
                                        color: ColorStyle.primaryColorGreen,
                                        textFirst: 'Coupan ro be applied: ',
                                        textSecond: controller
                                            .offers[controller.idx.value].code,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                text: controller
                                                    .offers[
                                                        controller.idx.value]
                                                    .code));
                                          },
                                          icon: Icon(
                                            Icons.copy_sharp,
                                            color:
                                                ColorStyle.secondryColorGreen,
                                          ))
                                    ],
                                  ),
                                  Text(controller
                                      .offers[controller.idx.value].description
                                      .toString()),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButtonCustom(
                                    BgColor: ColorStyle.primaryColorRed,
                                    radiusBorder: 50,
                                    onTap: () {
                                      controller.fetchOffers();
                                    },
                                    text: 'Apply Offer',
                                    size: Size(
                                        MediaQuery.of(context).size.width, 50),
                                  )
                                ]),
                          )
                        ])
                  : const SizedBox(
                      height: 0,
                    ),
            );
          });
        });
  }
}
