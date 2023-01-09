import 'package:flutter/material.dart';
import 'package:addcafe/GetxController/UserAuth_controller.dart';
import 'package:get/get.dart';

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
    bool _isObscure = true;
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: 1,
      decoration: InputDecoration(
          // suffixIcon: IconButton(
          //   icon: Icon(
          //     _isObscure ? Icons.visibility : Icons.visibility_off,
          //   ),
          //   onPressed: () {
          //     _isObscure = !_isObscure;
          //   },
          // ),
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

class PasswordFieldBase extends StatefulWidget {
  final TextEditingController? textcontroller;
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
  final Color? labelStyle;

  PasswordFieldBase(
      {Key? key,
      this.textcontroller,
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
      this.labelText,
      this.labelStyle = Colors.black})
      : super(key: key);

  @override
  State<PasswordFieldBase> createState() => _PasswordFieldBaseState();
}

class _PasswordFieldBaseState extends State<PasswordFieldBase> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   margin: widget.margin,
        //   decoration: BoxDecoration(
        // color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //       color: Color(0xffeeeeee),
        //       blurRadius: widget.radiusBorder!,
        //       offset: Offset(0, 4))
        // ],
        // borderRadius: BorderRadius.circular(widget.radiusBorder!),
        // border: Border.all(color: Colors.black.withOpacity(0.13))),
        // child:
        TextFormField(
      controller: widget.textcontroller,
      obscureText: _isObscure,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          hintText: widget.hintText,
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder!),
              borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder!),
              borderSide: BorderSide(color: widget.colorBoder!, width: 1)),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(widget.radiusBorder!)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(widget.radiusBorder!),
          //     borderSide: BorderSide(
          //       color: widget.colorBoder!,
          //     )),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: widget.labelStyle)),
      // ),
    );
  }
}
