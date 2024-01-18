import 'package:flutter/material.dart';

class BaseColors {
  static Color? hexColor(String colorCode) {
    var color = colorCode.toUpperCase().replaceAll("#", "");
    if (color.length == 6) {
      color = "FF$color";
    }
    if (color.length == 8) {
      try {
        return Color(int.parse("0x$color"));
      } catch (_) {}
    }
    return null;
  }

  static const Color background = Color(0xFF1A1A1A);
  static const Color background2 = Color(0xFF35373A);
  static const Color background3 = Color(0xFF212324);
  static const Color line = Color(0xFF1E2021);
  static const Color textLabel = Color(0xFF727678);
  static const Color tintPink = Color(0xFFFA6EE2);

  static const Color neutral900 = Color(0xFF212121);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral50 = Color(0xFFFAFAFA);

  static const Color black500 = Color(0xFF000000);
  static const Color black400 = Color(0xB3000000);
  static const Color black300 = Color(0x66000000);
  static const Color black200 = Color(0x4D000000);
  static const Color black100 = Color(0x1A000000);

  static const Color white500 = Color(0xFFFFFFFF);
  static const Color white400 = Color(0xB3FFFFFF);
  static const Color white300 = Color(0x66FFFFFF);
  static const Color white200 = Color(0x4DFFFFFF);
  static const Color white100 = Color(0x1AFFFFFF);

  static const Color blue500 = Color(0xFF007AFF);
  static const Color blue400 = Color(0xB3007AFF);
  static const Color blue300 = Color(0x66007AFF);
  static const Color blue200 = Color(0x4D007AFF);
  static const Color blue100 = Color(0x1A007AFF);
  static const Color blue50 = Color(0x0D007AFF);

  static const Color green500 = Color(0xFF00BC3C);
  static const Color green400 = Color(0xB300BC3C);
  static const Color green300 = Color(0x6600BC3C);
  static const Color green200 = Color(0x4D00BC3C);
  static const Color green100 = Color(0x1A00BC3C);
  static const Color green50 = Color(0x0D00BC3C);

  static const Color yellow500 = Color(0xFFFFC700);
  static const Color yellow400 = Color(0xB3FFC700);
  static const Color yellow300 = Color(0x66FFC700);
  static const Color yellow200 = Color(0x4DFFC700);
  static const Color yellow100 = Color(0x1AFFC700);
  static const Color yellow50 = Color(0x0DFFC700);
}
