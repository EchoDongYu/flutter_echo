import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetHelper {
  /// 底部按钮
  static Widget buildBottomButton({
    required String text,
    required VoidCallback? onPressed,
    bool enable = true,
  }) {
    return SafeArea(
      child: Container(
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
      ),
    );
  }

  /// 底部错误按钮
  static Widget buildBottomFailedButton({
    required String text,
    required VoidCallback? onPressed,
  }) {
    return SafeArea(
      child: Container(
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
      ),
    );
  }

  /// 底部双按钮
  static Widget buildBottomTwoButton({
    required String confirmText,
    required String cancelText,
    required VoidCallback? onConfirm,
    required VoidCallback? onCancel,
    bool enable = true,
  }) {
    return SafeArea(
      child: Container(
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
      ),
    );
  }

  /// 底部双按钮毛玻璃效果
  static Widget buildBottomBlurButton({
    required String confirmText,
    required String cancelText,
    required VoidCallback? onConfirm,
    required VoidCallback? onCancel,
    bool enable = true,
  }) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xCCFFFFFF),
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
                  child: EchoOutlinedButton(
                    text: cancelText,
                    onPressed: onCancel,
                  ),
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
          ),
        ),
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
  static Widget buildStepProgress({required int step, required int maxStep}) {
    List<Widget> list = List.generate(
      maxStep,
      (index) => _buildProgressItem(step, index + 1, maxStep),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(children: list),
    );
  }

  static Widget _buildProgressItem(int step, int index, int max) {
    final Widget indicator = Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: step >= index ? NowColors.c0xFF3288F1 : NowColors.c0xFFD8D8D8,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      margin: EdgeInsets.only(right: index != max ? 8.w : 0),
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
                  margin: EdgeInsets.symmetric(horizontal: 28.w),
                  decoration: BoxDecoration(
                    color: NowColors.c0xFF3288F1,
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      '$step/$max',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : indicator,
    );
  }

  /// 还款计划
  static Widget buildPlanItem(
    String planIndex, {
    required int? first,
    required double second,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: NowColors.c0xFFF3F3F5,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0.5, left: 0.5),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              planIndex,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(4.w, 12.h, 12.w, 12.h),
              child: Column(
                spacing: 6.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Vencimiento',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: NowColors.c0xFF494C4F,
                          height: 18 / 12,
                        ),
                      ),
                      Text(
                        first?.showDate ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF1C1F23,
                          height: 18 / 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Monto a pagar',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: NowColors.c0xFF494C4F,
                          height: 18 / 12,
                        ),
                      ),
                      Text(
                        second.showAmount,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: color,
                          height: 18 / 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
