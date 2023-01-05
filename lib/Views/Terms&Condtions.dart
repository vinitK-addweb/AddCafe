import 'package:addcafe/Components/AppBarStyle.dart';
import 'package:flutter/material.dart';
import '../GetxController/PrivacyPolicy_controller.dart';
import 'package:get/get.dart';

import '../Models/Model_Terms&Conditions.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class TermsConditions extends StatelessWidget {
  TermsConditions(this.termsCondtions, {super.key});

  RxList<TermsCondtionsModel> termsCondtions = <TermsCondtionsModel>[].obs;
  // final controller = Get.put(TermsCondtionsController());
  @override
  Widget build(BuildContext context) {
    return termsCondtions.isEmpty
        ? const SizedBox(
            height: 0,
          )
        : Container(
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
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Terms & Conditions",
                  style:
                      TextStylesCustom.textStyles_18.apply(fontWeightDelta: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(termsCondtions[0].tAndC.toString(),
                    style: TextStylesCustom.textStyles_13),
              ],
            ));
  }
}
