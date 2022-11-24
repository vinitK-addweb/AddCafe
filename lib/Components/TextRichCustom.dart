import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class TextRichCustom extends StatelessWidget {
  final String? textFirst;
  final String? textSecond;
  final Color? color;
  final Function()? onTap;

  const TextRichCustom(
      {Key? key,
      this.textFirst = 'Text First',
      this.textSecond = 'Text Second',
      this.color = Colors.red,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStylesCustom.textStyles_14.apply(),
        children: [
          TextSpan(
            text: textFirst,
            // style: TextStylesCustom.textStyles_14
          ),
          TextSpan(
            text: textSecond,
            style: TextStylesCustom.textStyles_14.apply(color: color),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
