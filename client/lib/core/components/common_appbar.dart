// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../utils/app_palettes.dart';
// import '../extensions/padding_extension.dart';
// import '../utils/dimens.dart';

// PreferredSize commonAppBar({
//   double? appBarHeight,
//   PreferredSize? bottom,
//   bool showClipper = true,
//   Color? statusBarColor = AppPalettes.whiteColor,
//   Color? bgColor,
//   bool foregroundColor = true,
//   Widget? child,
//   String? title,
//   Color? titleColor,
//   List<Widget>? action,
//   bool center = true,
//   Brightness? statusBarMode = Brightness.dark,
//   TextStyle? style,
//   double? elevation = 0,
//   double? scrollElevation = 2,
//   Color? iconColor,
//   bool? showBackButton,
// }) => PreferredSize(
//   preferredSize: Size.fromHeight(appBarHeight?? Dimens.appBarHeight),
//   child: AppBar(
//     toolbarHeight: Dimens.appBarHeight,
//     surfaceTintColor: AppPalettes.transparentColor,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: statusBarColor,
//       statusBarIconBrightness: statusBarMode,
//     ),
//     elevation: elevation,
//     scrolledUnderElevation: scrollElevation,
//     shadowColor: AppPalettes.shadowColor,
//     foregroundColor: AppPalettes.primaryColor,
//     backgroundColor: bgColor ?? AppPalettes.backgroundColor,
//     centerTitle: center,
//     bottom: bottom,
//     leadingWidth:  Dimens.appBarHeight,
//     leading: _buildLeadingWidget(
//       showBackButton,
//       iconColor,
//       iconSize:  Dimens.appBarHeight * 0.25,
//     ),
//     titleSpacing: 0,
//     iconTheme: iconColor != null ? IconThemeData(color: iconColor) : null,
//     title:
//         (child ??
//                 Text(
//                   title ?? "",
//                   style:
//                       style ??
//                       TextStyle(
//                         fontSize: 20.spMin,
//                         fontWeight: FontWeight.w600,
//                         color: titleColor ?? AppPalettes.blackColor,
//                       ),
//                 ).symmetricPadding(horizontal: Dimens.horizontalspacing))
//             ,
//     actions: action,
//     actionsPadding: EdgeInsets.only(right: Dimens.horizontalspacing),
//   ),
// );

// // Helper function to build leading widget conditionally
// Widget? _buildLeadingWidget(
//   bool? showBackButton,
//   Color? iconColor, {
//   required double iconSize,
// }) {
//   // If showBackButton is explicitly provided, respect it
//   if (showBackButton != null) {
//     return showBackButton
//         ? buildBackButton(
//             iconColor,
//             iconSize: iconSize,
//             size: Dimens.appBarHeight,
//           )
//         : null;
//   }

//   // Otherwise, check if we can pop
//   final context = RouteManager.context;
//   final canPop = Navigator.canPop(context);

//   if (canPop) {
//     // Check if there's a route to pop back to
//     return buildBackButton(
//       iconColor,
//       iconSize: iconSize,
//       size: Dimens.appBarHeight,
//     );
//   }

//   return null;
// }
