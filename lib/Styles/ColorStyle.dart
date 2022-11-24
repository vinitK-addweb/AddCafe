import 'package:flutter/material.dart';

class ColorStyle {
  static final Color scaffold = hex("#004383");
  static final Color white = Colors.white;
  static final Color primaryColorRed = hex("#D9042B");
  static final Color primaryColorGreen = hex("#158C03");
  static final Color secondryColorBlack = hex("#111111");
  static final Color secondryColorYellow = hex("#F2A341");
  static final Color secondryColorGreen = hex("#008000");
  static final Color secondryColorRed = hex("#D40000");
  static final Color secondaryColorgrey = hex('#545454');
  static final Color Background = hex('#FAFAFA');

  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ColorConversion on Color {
  MaterialColor toMaterialColor() {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final r = red, g = green, b = blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }
}
