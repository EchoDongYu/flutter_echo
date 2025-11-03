import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 通用提示弹窗
class PromptDialog extends StatelessWidget {
  final String? icon;
  final String title;
  final String content;
  final String confirmText;
  final String? cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final bool barrierDismissible; // 新增：控制点击外部关闭
  final bool canPop;// 新增：控制返回键关闭

  const PromptDialog({
    super.key,
    this.icon,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
    this.barrierDismissible  = true, // 默认允许点击外部关闭
    this.canPop  = true,             // 默认允许返回键关闭
  });

  /// 显示通用提示弹窗
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmText,
    String? cancelText,
    String? icon,
    bool barrierDismissible = true, // 外部控制参数
    bool canPop = true,             // 外部控制参数
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible, // 动态控制外部点击
      builder: (_) => PopScope(
        canPop: canPop,  // 动态控制返回键
        child: PromptDialog(
          icon: icon,
          title: title,
          content: content,
          confirmText: confirmText,
          cancelText: cancelText,
          barrierDismissible: barrierDismissible, // 传递参数
          canPop: canPop,                         // 传递参数
          onConfirm: () => context.pop(true),
          onCancel: () => context.pop(false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tipIcon = icon;
    final showCancel = cancelText != null;
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tipIcon != null) ...[
              Image.asset(tipIcon, width: 70.r, height: 70.r),
              SizedBox(height: 24.h),
            ],
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF1C1F23,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (content.isNotEmpty) ...[
              SizedBox(height: showCancel ? 12.h : 16.h),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: NowColors.c0xFF494C4F,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
            SizedBox(height: 24.h),
            if (showCancel)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: EchoOutlinedButton(
                      text: cancelText!,
                      onPressed: onCancel,
                      textColor: NowColors.c0xFF3288F1,
                      borderColor: NowColors.c0xFF3288F1,
                      filledColor: NowColors.c0xFFEFF7FF,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: EchoPrimaryButton(
                      text: confirmText,
                      onPressed: onConfirm,
                    ),
                  ),
                ],
              )
            else
              EchoPrimaryButton(text: confirmText, onPressed: onConfirm),
          ],
        ),
      ),
    );
  }
}
