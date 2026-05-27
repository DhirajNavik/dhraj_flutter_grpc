import 'package:flutter/material.dart';

class AppPalettes {
  static Color splashColor = Color.fromRGBO(25, 118, 210, 1);
  static const primaryColor = Color(0xFF1976D2);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static Color cardColor = Color(0x1AEDE7E0);
  static Color textPrimary = Color.fromRGBO(15, 23, 42, 1);
  static Color textSecondary = Color.fromRGBO(100, 116, 139, 1);
  static const errorColor = Color.fromRGBO(239, 68, 68, 1);
  static Color successColor = Color.fromRGBO(34, 197, 94, 1);
  static Color pendingColor = Color.fromRGBO(229, 127, 31, 1);
  static const blackColor = Color(0xff000000);
  static const greyColor = Color(0xFF9E9E9E);
  static const hintColor = Color(0xFF9E9E9E);
  static const yellowColor = Color.fromARGB(255, 227, 234, 36);
  static const whiteColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Colors.transparent;
  static const shadowColor = Color(0xffF3F4F4);
  static const liteGreyColor = Color(0xffF3F4F4);
  static const liteTextFormFieldColor = Color.fromARGB(255, 187, 189, 189);
  static const redColor = Colors.red;
  static const borderColor = Color(0xFFE2E8F0);
  static const calendarPresentColor = Color(0xff369F27);
  static const calendarAbsentColor = Color(0xffB60003);
  static const calendarLateColor = Color.fromARGB(255, 215, 188, 13);

  static const gradientFirstColor = Color(0xFF1E40AF);
  static const gradientSecondColor = Color(0xFF3B82F6);
  static const lightBrownColor = Color(0xFFE3B99C);

}

extension ColorWithOpacity on Color {
  Color withOpacityExt(double val) {
    return withValues(alpha: val);
  }
}
