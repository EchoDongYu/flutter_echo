import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';

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
        padding: padding ?? const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 16,
          bottom: 16,
        ),
        alignment: alignment,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 12,
          ),
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
