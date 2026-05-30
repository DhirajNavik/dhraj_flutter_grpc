import 'package:client/core/extensions/responsive_extension.dart';
import 'package:client/core/helpers/responsive_layout.dart';
import 'package:client/core/utils/app_palettes.dart';
import 'package:client/core/utils/dimens.dart';
import 'package:client/feature/auth/presentation/components/login_app_bar.dart';
import 'package:flutter/material.dart';

import '../components/login_logo.dart';
import '../components/mobile_login_widget.dart';
import '../components/tablet_login_widget.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        tablet: Row(
          children: [
            Container(
              width: 0.35.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimens.radiusX4),
                  bottomRight: Radius.circular(Dimens.radiusX4),
                ),
                gradient: LinearGradient(
                  colors: [
                    AppPalettes.gradientFirstColor,
                    AppPalettes.gradientSecondColor,
                  ],
                ),
              ),
              child:  LoginLogo(isTablet: true),
            ),
            TabletLoginWidget(),
          ],
        ),
        mobile: NestedScrollView(
          headerSliverBuilder: (nested, isScrolling) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(nested),
                sliver: SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: LoginAppBarWidget(isScrolled: isScrolling),
                ),
              ),
            ];
          },
          body: MobileLoginWidget(),
        ),
      ),
    );
  }
}
