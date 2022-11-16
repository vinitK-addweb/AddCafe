import 'package:addcafe/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';

BoxDecoration boxDecorationAuthBox() {
  return BoxDecoration(
      color: ColorStyle.Background,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          // blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ]);
}
