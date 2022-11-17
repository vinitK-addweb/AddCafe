import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/AppBarStyle.dart';
import '../GetxController/MyHomePage_controller.dart';
import '../Components/TextRichCustom.dart';
import '../Views/HomeBanner.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../GetxController/Offers_controller.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBanner = Get.put(HomeBannerController());
    final controller = Get.put(OffersController());
    // return GetBuilder(builder: (_) {
    return Obx(() {
      return Scaffold(
        appBar: AppBarStyle(
          styleTitle: TextStylesCustom.textStyles_24,
          elevation: 0,
          title: 'Offers',
          backgroundColor: ColorStyle.primaryColorRed,
          leading: IconButton(
            onPressed: (() => Get.back()),
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeBanner(
                bannerData: homeBanner.bannerData.value,
                autoplay: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                        style: TextStylesCustom.textStyles_20
                            .apply(color: ColorStyle.secondryColorRed),
                      ),
                      Text(
                        'To redeem the coupon code, the claimant types the coupon code into the promotional box in the booking field of the Quovai\'s websites and the relevant discount will be automatically deducted from the final price of the qualifying purchase. If the claimant fails to enter the coupon code at the time of purchase as specified, the purchase will not be eligible for the discount. Discounts may not be claimed after confirmation of a claimant\'s purchase',
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
                            textSecond: '30off',
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.copy_sharp,
                                color: ColorStyle.secondryColorGreen,
                              ))
                        ],
                      ),
                      Text(
                          'Flat 30% off upto Rs. 90 on orders above 149. This offer is not applicable on pizzas'),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButtonCustom(
                        radiusBorder: 50,
                        onTap: () {
                          controller.fetchOffers();
                        },
                        text: 'Apply Offer',
                        size: Size(MediaQuery.of(context).size.width, 50),
                      )
                    ]),
              )
            ]),
      );
      // });
    });
  }
}
