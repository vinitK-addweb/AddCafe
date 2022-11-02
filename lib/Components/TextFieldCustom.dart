import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final int? maxLines;
  final EdgeInsets? margin;
  final String? labelText;

  TextFieldBase(
      {Key? key,
      this.controller,
      this.padding = EdgeInsets.zero,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.colorFill = Colors.white,
      this.colorBoder = Colors.red,
      this.colorHint = Colors.grey,
      this.colorText = Colors.black,
      this.textStyle = const TextStyle(),
      this.radiusBorder = 10.0,
      this.maxLines = 1,
      this.margin = EdgeInsets.zero,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xffeeeeee), blurRadius: 10, offset: Offset(0, 4))
        ],
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: Colors.black.withOpacity(0.13))
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: 1,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            // focusColor: Colors.black,
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusBorder!),
                borderSide: BorderSide(color: colorBoder!)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusBorder!),
                borderSide: BorderSide(
                  color: colorBoder!,
                )),
            hintText: hintText,
            hintStyle: textStyle!.apply(color: colorHint)),
        style: textStyle!,
      ),
    );
  }
}
