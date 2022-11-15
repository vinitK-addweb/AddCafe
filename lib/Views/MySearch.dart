import 'dart:async';

import 'package:flutter/material.dart';
import 'shimmer.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';

class Mysearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bool Loading = false;
    // return ListView.builder(
    //     itemCount: 1,
    //     itemBuilder: (context, index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // height: 54,
      child: TextField(
        style: TextStylesCustom.textStyles_16,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 30, bottom: 0),
            hintStyle: TextStylesCustom.textStyles_16
                .apply(color: ColorStyle.secondryColorBlack),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Dish Name Or Type...',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red))),
        onChanged: ((value) => {}),
      ),
    );
  }
}
