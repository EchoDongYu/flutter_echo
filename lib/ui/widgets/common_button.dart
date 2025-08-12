import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮组件封装基类
abstract class _EchoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;

  const _EchoButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.textColor,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.height,
  });

  static final EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 8.h,
  );

  Color disableColor(Color color) => color.withValues(alpha: 0.67);
}

/// 主题渐变色按钮组件
class EchoPrimaryButton extends _EchoButton {
  final List<Color> gradientColors;

  const EchoPrimaryButton({
    super.key,
    required super.text,
    super.onPressed,
    super.textColor = Colors.white,
    super.fontSize,
    super.fontWeight = FontWeight.w500,
    super.width,
    super.height,
    this.gradientColors = const [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 48.h,
        padding: _EchoButton.padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: onPressed != null
                ? gradientColors
                : gradientColors.map(disableColor).toList(),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

/// 纯色按钮组件
class EchoSecondaryButton extends _EchoButton {
  final Color filledColor;
  final double? elevation;

  const EchoSecondaryButton({
    super.key,
    required super.text,
    super.onPressed,
    super.textColor = Colors.white,
    super.fontSize,
    super.fontWeight = FontWeight.w500,
    super.width,
    super.height,
    this.filledColor = NowColors.c0xFF3288F1,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null
              ? filledColor
              : disableColor(filledColor),
          elevation: elevation,
          padding: _EchoButton.padding,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

/// 轮廓按钮组件
class EchoOutlinedButton extends _EchoButton {
  final Color borderColor;
  final Color filledColor;
  final double outlineWidth;

  const EchoOutlinedButton({
    super.key,
    required super.text,
    super.onPressed,
    super.textColor = NowColors.c0xFF1C1F23,
    super.fontSize,
    super.fontWeight = FontWeight.w500,
    super.width,
    super.height,
    this.borderColor = NowColors.c0xFFB0B1B2,
    this.filledColor = Colors.transparent,
    this.outlineWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: filledColor,
          padding: _EchoButton.padding,
          side: BorderSide(color: borderColor, width: outlineWidth),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
