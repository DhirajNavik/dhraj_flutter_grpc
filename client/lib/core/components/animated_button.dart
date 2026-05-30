import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../extensions/context_extension.dart';
import '../utils/app_palettes.dart';
import '../utils/dimens.dart';

/// Default App Button
class CommonButton extends StatefulWidget {
  final Function? onTap;
  final String? text;
  final double? width;
  final bool fullWidth;
  final Color? color;
  final Color disabledColor;
  final Color? focusColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final Widget? child;
  final double? elevation;
  final double? height;
  final bool? enableScaleAnimation;
  final double? radius;
  final BorderRadius? onlyRadius;
  final bool isLoading;
  final bool isAnimationEnable;
  final bool isEnable;
  final Color? splashColor;
  final Color? borderColor;
  final Color? indicatorColor;
  final Color? textColor;
  final BorderSide? side;
  final double? fontSize;

  const CommonButton({
    this.onTap,
    this.text,
    this.width,
    this.color,
    this.fullWidth = true,
    this.padding,
    this.textStyle,
    this.textColor,
    this.shapeBorder,
    this.child,
    this.elevation,
    this.onlyRadius,
    this.isAnimationEnable = true,
    this.height,
    this.isEnable = true,
    this.disabledColor = AppPalettes.greyColor,
    this.focusColor,
    this.splashColor,
    this.enableScaleAnimation = true,
    this.radius,
    this.isLoading = false,
    this.borderColor,
    this.side,
    super.key,
    this.fontSize,
    this.indicatorColor,
    this.margin,
  });

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with TickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _gradientController;
  late AnimationController _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation.validate(value: widget.isAnimationEnable)) {
      _gradientController =
          AnimationController(vsync: this, duration: Duration(seconds: 6))
            ..forward()
            ..repeat();

      _controller =
          AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 50),
            lowerBound: 0.0,
            upperBound: 0.1,
          )..addListener(() {
            setState(() {});
          });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isAnimationEnable) {
      _scale = 1 - _controller.value;
    }

    if (widget.enableScaleAnimation.validate(value: true)) {
      return Listener(
        onPointerDown: (details) {
          _controller.forward();
        },
        onPointerUp: (details) {
          _controller.reverse();
        },
        child: Transform.scale(scale: _scale, child: buildButton()),
      );
    } else {
      return buildButton();
    }
  }

  Widget buildButton() {
    return AnimatedBuilder(
      animation: _gradientController,
      builder: (context, _) {
        return InkWell(
          onTap: widget.isEnable ? widget.onTap as void Function()? : null,
          overlayColor: WidgetStatePropertyAll(AppPalettes.transparentColor),
          child: Container(
            width: widget.fullWidth ? widget.width ?? double.infinity : null,
            height: (widget.height ?? Dimens.buttonHeight),
            margin: widget.margin,
            padding:
                widget.padding ??
                EdgeInsets.symmetric(
                  horizontal: Dimens.allPaddingX3,
                  vertical: Dimens.allPaddingX3,
                ),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.isEnable
                    ? [
                        widget.color ?? AppPalettes.gradientFirstColor,
                        widget.color ?? AppPalettes.gradientSecondColor,
                      ]
                    : [widget.disabledColor, widget.disabledColor],
                transform: GradientRotation(_gradientController.value * 2 * pi),
              ),
              borderRadius:
                  widget.onlyRadius ??
                  BorderRadius.circular(widget.radius ?? Dimens.radiusX3),
              border: Border.all(
                color:
                    widget.borderColor ??
                    AppPalettes.whiteColor.withOpacityExt(0.2),
                width: 1.4,
              ),
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: widget.isLoading
                  ? CircularProgressIndicator(
                      color: widget.indicatorColor ?? AppPalettes.whiteColor,
                      strokeWidth: 2.h,
                    )
                  : widget.child ??
                        Text(
                          widget.text ?? "",
                          style:
                              widget.textStyle ??
                              context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    widget.textColor ?? AppPalettes.whiteColor,
                              ),
                        ),
            ),
          ),
        );
      },
    );
  }
}

// Boolean Extensions
extension BooleanExtensions on bool? {
  /// Validate given bool is not null and returns given value if null.
  bool validate({bool value = false}) => this ?? value;

  /// get int value from bool
  int getIntBool({bool value = false}) {
    if (this ?? value) {
      return 1;
    } else {
      return 0;
    }
  }
}
