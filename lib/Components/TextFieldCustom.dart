import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../GetxController/UserAuth_controller.dart';
import 'dart:async';

class TextFieldUnderline extends StatelessWidget {
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
  final String? labelText;

  TextFieldUnderline({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: 1,
      decoration: InputDecoration(
          labelText: labelText,
          fillColor: colorFill,
          contentPadding: padding,
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: colorHint)),
      style: textStyle!,
    );
  }
}

class TextFormFieldUnderline extends StatelessWidget {
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
  final String? labelText;
  final String? Function(String?)? validator;
  final bool? obscure;
  final bool? readOnly;
  TextFormFieldUnderline({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.labelText,
    this.validator,
    this.obscure = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscure!,
        keyboardType: keyboardType,
        readOnly: readOnly!,
        decoration: InputDecoration(
          errorStyle: TextStylesCustom.textStyles_12,
          labelText: labelText,
          labelStyle: TextStylesCustom.textStyles_14
              .apply(color: ColorStyle.secondryColorBlack),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: colorHint),
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
        ),
        validator: validator!);
  }
}

class PasswordFieldUnderline extends StatelessWidget {
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
  final String? labelText;
  final String? Function(String?)? validator;

  PasswordFieldUnderline({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAuth = UserAuth();
    // bool _isObscure = true;
    return Obx(() {
      return TextFormField(
        obscureText: userAuth.isObscure.value,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: 1,
        validator: validator,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                userAuth.isObscure.value
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onPressed: () {
                userAuth.obscure();
              },
            ),
            labelText: labelText,
            fillColor: colorFill,
            contentPadding: padding,
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(radiusBorder!),
                borderSide: BorderSide(color: colorBoder!, width: 1)),
            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(radiusBorder!),
                borderSide: BorderSide(color: colorBoder!, width: 1)),
            hintText: hintText,
            hintStyle: textStyle!.apply(color: colorHint)),
        style: textStyle!,
      );
    });
  }
}

class TextFieldUnderlinePrefixText extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? prefixText;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final int? maxLines;

  TextFieldUnderlinePrefixText({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.prefixText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colorBoder!, width: 0.6))),
      child: Row(
        children: [
          Text(
            prefixText!,
            style: textStyle!,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: colorFill,
              contentPadding: padding,
              hintText: hintText,
              hintStyle: textStyle!.apply(color: colorHint),
            ),
            style: textStyle!,
          )),
        ],
      ),
    );
  }
}

class TextFieldOutline extends StatelessWidget {
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

  TextFieldOutline({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
          fillColor: colorFill,
          contentPadding: padding,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusBorder!),
              borderSide: BorderSide(color: colorBoder!, width: 1)),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: colorHint)),
      style: textStyle!,
    );
  }
}

class TextFieldPWDOutline extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? hintText;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;

  const TextFieldPWDOutline({
    Key? key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.hintText,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 8.0,
  }) : super(key: key);

  @override
  _TextFieldPWDOutlineState createState() => _TextFieldPWDOutlineState();
}

class _TextFieldPWDOutlineState extends State<TextFieldPWDOutline> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscureText,
      controller: widget.controller,
      style: widget.textStyle!,
      decoration: InputDecoration(
          fillColor: widget.colorFill,
          contentPadding: widget.padding,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder!),
              borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder!),
              borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
          hintText: widget.hintText,
          hintStyle: widget.textStyle!.apply(color: widget.colorHint),
          suffixIcon: IconButton(
            icon: Icon(
              isObscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              isObscureText = !isObscureText;
              setState(() {});
            },
          )),
    );
  }
}
