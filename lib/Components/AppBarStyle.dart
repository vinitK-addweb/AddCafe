import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarStyle extends StatelessWidget implements PreferredSizeWidget {
  final SystemUiOverlayStyle? overlayStyle;
  final Color? backgroundColor;
  final String? title;
  final TextStyle? styleTitle;
  final Widget? leading;
  final List<Widget>? trailings;
  final double? elevation;
  final bool? centerTitle;

  AppBarStyle({
    Key? key,
    this.overlayStyle,
    this.backgroundColor = Colors.white,
    this.title = 'Title ... ',
    this.styleTitle = const TextStyle(color: Colors.white),
    this.leading = const SizedBox(
      width: 0,
    ),
    this.trailings,
    this.elevation = 1,
    this.centerTitle = true,
  }) : super(key: key);

  double heightAppBar = 54;

  @override
  Size get preferredSize => new Size.fromHeight(heightAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      systemOverlayStyle: overlayStyle,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      title: Text(title!, style: styleTitle!),
      leading: leading,
      actions: [
        if (trailings != null) Row(children: trailings!),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }
}
