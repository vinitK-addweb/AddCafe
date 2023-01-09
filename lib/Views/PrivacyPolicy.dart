import 'package:addcafe/Components/AppBarStyle.dart';
import 'package:addcafe/Views/Aboutus.dart';
import 'package:flutter/material.dart';

import '../GetxController/PrivacyPolicy_controller.dart';
import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'Terms&Condtions.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});
  final controller = Get.put(PrivacyPolicyController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PrivacyPolicyController(),
      initState: controller.initfunction(),
      builder: (_) {
        return Obx(() {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBarStyle(
              styleTitle: TextStylesCustom.textStyles_20,
              elevation: 0,
              title: 'Privacy Policy',
              backgroundColor: ColorStyle.primaryColorRed,
              leading: IconButton(
                onPressed: () => Get.back(),
                // scaffoldKey.currentState!.openDrawer(),
                // currentIndex.value = 0,
                icon: const Icon(
                  Icons.arrow_back,
                  size: 34,
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              blurRadius: 4.0,
                              spreadRadius: 6,
                              offset: const Offset(0, 0))
                        ],
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        color: Colors.grey.withOpacity(0.15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Privacy Policy",
                            style: TextStylesCustom.textStyles_18
                                .apply(fontWeightDelta: 2),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(controller.privacyPolicy[0].pAndP.toString(),
                              style: TextStylesCustom.textStyles_13),
                        ],
                      )),
                  TermsConditions(controller.termsCondtions),
                  const SizedBox(
                    height: 10,
                  ),
                  AboutUs()
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
