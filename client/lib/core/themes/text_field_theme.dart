import '../utils/app_palettes.dart';
import '../utils/dimens.dart';
import 'package:flutter/material.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    fillColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.focused)
          ? AppPalettes.whiteColor
          : AppPalettes.redColor;
    }),
    prefixIconColor: AppPalettes.blackColor,
    suffixIconColor: AppPalettes.blackColor,
    contentPadding: EdgeInsets.symmetric(
      vertical: Dimens.allPaddingX4,
      horizontal: Dimens.allPaddingX3,
    ),
    labelStyle: const TextStyle().copyWith(
      color: AppPalettes.blackColor,
      fontWeight: FontWeight.bold,
    ),
    hintStyle: const TextStyle().copyWith(
      color: AppPalettes.hintColor,
      fontWeight: FontWeight.w400,
    ),
    errorStyle: const TextStyle().copyWith(
      color: AppPalettes.errorColor,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppPalettes.blackColor,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Dimens.radiusX2),
      borderSide: BorderSide(
        width: 1,
        color: AppPalettes.liteTextFormFieldColor,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Dimens.radiusX2),
      borderSide: BorderSide(
        width: 1,
        color: AppPalettes.liteTextFormFieldColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Dimens.radiusX2),

      borderSide: const BorderSide(width: 1, color: AppPalettes.blackColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Dimens.radiusX2),
      borderSide: BorderSide(
        width: 1,
        color: AppPalettes.errorColor.withOpacityExt(0.2),
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Dimens.radiusX2),
      borderSide: const BorderSide(width: 2, color: AppPalettes.errorColor),
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
  );
}

//   static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
//     errorMaxLines: 2,
//     prefixIconColor: TColors.darkGrey,
//     suffixIconColor: TColors.darkGrey,
//     // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
//     labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeMd, color: TColors.white),
//     hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm, color: TColors.white),
//     floatingLabelStyle: const TextStyle().copyWith(color: TColors.white.withOpacity(0.8)),
//     border: const OutlineInputBorder().copyWith(
//       borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
//       borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
//     ),
//     enabledBorder: const OutlineInputBorder().copyWith(
//       borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
//       borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
//     ),
//     focusedBorder: const OutlineInputBorder().copyWith(
//       borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
//       borderSide: const BorderSide(width: 1, color: TColors.white),
//     ),
//     errorBorder: const OutlineInputBorder().copyWith(
//       borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
//       borderSide: const BorderSide(width: 1, color: TColors.warning),
//     ),
//     focusedErrorBorder: const OutlineInputBorder().copyWith(
//       borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
//       borderSide: const BorderSide(width: 2, color: TColors.warning),
//     ),
//   );
// }
