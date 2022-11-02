import 'package:flutter/material.dart';

class PasswordFieldBase extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xffeeeeee),
                blurRadius: radiusBorder!,
                offset: Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(radiusBorder!),
          border: Border.all(color: Colors.black.withOpacity(0.13))),
      child: TextFormField(
        controller: textcontroller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                // _isObscure ? Icons.visibility :
                Icons.visibility_off,
              ),
              onPressed: () {
                // setState(() {
                //   _isObscure = !_isObscure;
                // });
              },
            ),
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusBorder!)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusBorder!),
                borderSide: BorderSide(
                  color: colorBoder!,
                )),
            labelText: labelText,
            labelStyle: TextStyle(color: labelStyle)),
      ),
    );
  }
}
