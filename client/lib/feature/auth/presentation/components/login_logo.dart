import 'package:client/core/extensions/context_extension.dart';
import 'package:client/core/extensions/responsive_extension.dart';
import 'package:client/core/helpers/common_helpers.dart';
import 'package:client/core/utils/app_images.dart';
import 'package:client/core/utils/app_palettes.dart';
import 'package:client/core/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginLogo extends StatelessWidget {
  final bool isTablet;
  const LoginLogo({super.key, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: isTablet ? .center : .end,
      spacing: Dimens.gapX1,
      children: [
        Image.asset(
          AppImages.logoIcon,
          fit: BoxFit.cover,
          width: isTablet ? 40.width() : 60.width(),
          color: AppPalettes.whiteColor,
        ),
        CommonHelpers.buildOneLineText(
          "Smart Edu Connect",
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: isTablet ? 24.spMin : null,
            color: AppPalettes.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
