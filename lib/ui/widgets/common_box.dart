import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBox extends StatelessWidget {
  const CommonBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.borderWidth,
    this.color,
    this.borderColor,
    this.margin,
    this.padding,
    this.alignment,
    this.child,
    this.onTap,
    this.onLongPress,
    this.gradient,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final double? borderWidth;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Gradient? gradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        alignment: alignment,
        decoration: BoxDecoration(
          gradient: gradient,
          color: color ?? NowColors.c0xFFFFFFFF,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          border: Border.all(
            color: borderColor ?? NowColors.c0x00000000,
            width: borderWidth ?? 0,
          ),
        ),
        child: child,
      ),
    );
  }
}
