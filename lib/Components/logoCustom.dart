import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';

class LogoCustom extends StatelessWidget {
  const LogoCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: SvgPicture.asset(ImageStyle.logo),
        ),
        // Expanded(
        //     child:
        const SizedBox(
          width: 10,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Food Solution Cafe',
              style: TextStylesCustom.textStyles_20,
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Text('Food that makes you happy',
                style: TextStylesCustom.textStyles_12.apply(color: Colors.grey))
          ],
        )
        // )
      ],
    );
  }
}

class LogoCustomWhite extends StatelessWidget {
  const LogoCustomWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: SvgPicture.asset(
            ImageStyle.logo,
            color: Colors.white,
          ),
          height: 44,
          width: 44,
        ),
        // Expanded(
        //     child:
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FittedBox(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Food Solution Cafe',
                  style: TextStylesCustom.textStyles_20,
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Text('Food that makes you happy',
                    style: TextStylesCustom.textStyles_12
                        .apply(color: Colors.white))
              ],
            ),
          ),
        )
        // )
      ],
    );
  }
}
