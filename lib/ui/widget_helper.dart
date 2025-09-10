import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetHelper {
  /// 底部按钮
  static Widget buildBottomButton({
    required String text,
    required VoidCallback? onPressed,
    bool enable = true,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color(0xD9FFFFFF), width: 1),
        boxShadow: NowStyles.bottomShadows,
      ),
      child: EchoPrimaryButton(
        text: text,
        enable: enable,
        onPressed: onPressed,
      ),
    );
  }

  /// 底部错误按钮
  static Widget buildFailedButton({
    required String text,
    required VoidCallback? onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color(0xD9FFFFFF), width: 1),
        boxShadow: NowStyles.bottomShadows,
      ),
      child: EchoSecondaryButton(
        text: text,
        filledColor: NowColors.c0xFFFB4F34,
        onPressed: onPressed,
      ),
    );
  }

  /// 底部双按钮
  static Widget buildBottomButton2({
    required String confirmText,
    required String cancelText,
    required VoidCallback? onConfirm,
    required VoidCallback? onCancel,
    bool enable = true,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xD9FFFFFF),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: NowStyles.bottomShadows,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: EchoOutlinedButton(text: cancelText, onPressed: onCancel),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: EchoPrimaryButton(
              text: confirmText,
              enable: enable,
              onPressed: onConfirm,
            ),
          ),
        ],
      ),
    );
  }

  /// 顶部渐变背景
  static Widget buildTopGradient({
    required BuildContext context,
    required double height,
    Widget? child,
  }) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      height: height + statusBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }

  /// 认证进度
  static Widget buildStepProgress({required int step}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          _buildProgressItem(step, 1),
          SizedBox(width: 8.w),
          _buildProgressItem(step, 2),
          SizedBox(width: 8.w),
          _buildProgressItem(step, 3),
        ],
      ),
    );
  }

  static Widget _buildProgressItem(int step, int index) {
    final Widget indicator = Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: step >= index ? NowColors.c0xFF3288F1 : NowColors.c0xFFD8D8D8,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
    return Expanded(
      child: step == index
          ? Stack(
              alignment: Alignment.center,
              children: [
                indicator,
                Container(
                  width: 56.w,
                  height: 26.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 28.w),
                  decoration: BoxDecoration(
                    color: NowColors.c0xFF3288F1,
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    '$step/3',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : indicator,
    );
  }
}
