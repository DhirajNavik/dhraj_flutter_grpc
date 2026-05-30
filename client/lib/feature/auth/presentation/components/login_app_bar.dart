import 'package:client/core/extensions/responsive_extension.dart';
import 'package:client/core/utils/app_palettes.dart';
import 'package:client/core/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'login_logo.dart';

class LoginAppBarWidget extends StatefulWidget {
  final bool isScrolled;
  const LoginAppBarWidget({super.key, required this.isScrolled});

  @override
  State<LoginAppBarWidget> createState() => _LoginAppBarWidgetState();
}

class _LoginAppBarWidgetState extends State<LoginAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppPalettes.transparentColor,
      pinned: true,
      expandedHeight: 170.height(),
      collapsedHeight: 120.height(),
      floating: true,
      snap: true,
      stretch: true,
      scrolledUnderElevation: 2,
      shadowColor: AppPalettes.shadowColor,

      surfaceTintColor: AppPalettes.transparentColor,
      clipBehavior: Clip.hardEdge,

      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(Dimens.radiusX4),
            bottomRight: Radius.circular(Dimens.radiusX4),
          ),
          gradient: LinearGradient(
            colors: [
              AppPalettes.gradientFirstColor,
              AppPalettes.gradientSecondColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FlexibleSpaceBar(
          expandedTitleScale: 1.5,
          collapseMode: CollapseMode.parallax,
          centerTitle: true,
          title: LoginLogo()
        ),
      ),
    );
  }
}
