import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮组件封装基类
abstract class _EchoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool enable;

  const _EchoButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    required this.enable,
  });

  static final EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 12.h,
  );

  Color disableColor(Color color) => color.withValues(alpha: 0.5);
}

/// 主题渐变色按钮组件
class EchoPrimaryButton extends _EchoButton {
  final List<Color> gradientColors;

  const EchoPrimaryButton({
    super.key,
    required super.text,
    super.onPressed,
    super.textColor = Colors.white,
    super.fontWeight = FontWeight.w500,
    super.fontSize,
    super.enable = true,
    this.gradientColors = const [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(48.h),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: _EchoButton.padding,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: enable
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
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/// 纯色按钮组件
class EchoSecondaryButton extends _EchoButton {
  final Color filledColor;

  const EchoSecondaryButton({
    super.key,
    required super.text,
    super.onPressed,
    super.textColor = Colors.white,
    super.fontWeight = FontWeight.w500,
    super.fontSize,
    super.enable = true,
    this.filledColor = NowColors.c0xFF3288F1,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(48.h),
        backgroundColor: enable ? filledColor : disableColor(filledColor),
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
    super.fontWeight = FontWeight.w500,
    super.fontSize,
    super.enable = true,
    this.borderColor = NowColors.c0xFFB0B1B2,
    this.filledColor = Colors.transparent,
    this.outlineWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enable ? onPressed : null,
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(48.h),
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
    );
  }
}
