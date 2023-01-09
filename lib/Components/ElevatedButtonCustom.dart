import 'package:get/get.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/SizeStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Size size;
  final Color? BgColor;
  final double? radiusBorder;
  const ElevatedButtonCustom({
    Key? key,
    this.onTap,
    this.text = "Elevated Button",
    this.size = const Size(100, 50),
    this.BgColor = Colors.red,
    this.radiusBorder = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: BgColor,
        elevation: 0,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        fixedSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusBorder!),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text!,
        style: TextStylesCustom.textStyles_14.apply(fontWeightDelta: 2),
      ),
    );
  }
}

class ElevatedButtonCustoms extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color? colorBG;
  final Color? colorText;
  final double? width;
  final double? height;

  const ElevatedButtonCustoms({
    Key? key,
    this.onTap,
    this.text = "Elevated Button",
    this.colorBG = Colors.blue,
    this.colorText = Colors.white,
    this.width = 50,
    this.height = 50,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorBG,
        elevation: 0,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        fixedSize: Size(width!, height!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeStyle.size_14),
        ),
      ),
      onPressed: onTap,
      child: Text(text!,
          style: TextStylesCustom.textStyles_14
              .apply(color: ColorStyle.primaryColorRed)),
    );
  }
}
