import '../themes/appbar_theme.dart';
import '../themes/text_field_theme.dart';
import '../themes/text_theme.dart';
import '../utils/app_palettes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get lightTheme =>  ThemeData(
    useMaterial3: true,
    disabledColor: AppPalettes.greyColor,
    brightness: Brightness.light,
    primaryColor: AppPalettes.primaryColor,
    textTheme: AppTextStyles.lightTextTheme,
    // chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppPalettes.backgroundColor,
    appBarTheme: AppBarThemes.lightAppBarTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    cardColor: AppPalettes.cardColor,
  );
}
