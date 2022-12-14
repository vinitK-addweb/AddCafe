import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../Models/Model_Terms&Conditions.dart';

import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            // Image.asset('')
            SizedBox(
              height: 150,
              width: 300,
              child: SvgPicture.asset(ImageStyle.logo),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Food Solution Addweb",
              style: TextStylesCustom.textStyles_24.apply(fontWeightDelta: 3),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
              style: TextStylesCustom.textStyles_17,
            ),

            const SizedBox(
              height: 10,
            ),
            const Text("Version: 1.0.0")
          ],
        ));
  }
}
