import '../utils/app_palettes.dart';
import 'package:flutter/material.dart';

class AppBarThemes {
  AppBarThemes._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppPalettes.transparentColor,
    surfaceTintColor: AppPalettes.transparentColor,
    iconTheme: IconThemeData(
      color: AppPalettes.blackColor,
    ),
    actionsIconTheme: IconThemeData(
      color: AppPalettes.blackColor,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppPalettes.blackColor,
    ),
  );
}
