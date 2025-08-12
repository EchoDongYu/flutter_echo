import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 通用提示弹窗组件
class PromptDialog extends StatefulWidget {
  final String title;
  final String content;
  final String confirmText;
  final String? cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const PromptDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
  });

  @override
  State<PromptDialog> createState() => _PromptDialogState();
}

class _PromptDialogState extends State<PromptDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get showCancel => widget.cancelText != null;

  @override
  Widget build(BuildContext context) {
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
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF1C1F23,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: showCancel ? 12.h : 16.h),
            Text(
              widget.content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF494C4F,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24.h),
            if (showCancel)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: EchoOutlinedButton(
                      text: widget.cancelText!,
                      onPressed: widget.onCancel,
                      textColor: NowColors.c0xFF3288F1,
                      borderColor: NowColors.c0xFF3288F1,
                      filledColor: NowColors.c0xFFEFF7FF,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: EchoPrimaryButton(
                      text: widget.confirmText,
                      onPressed: widget.onConfirm,
                    ),
                  ),
                ],
              )
            else
              EchoPrimaryButton(
                text: widget.confirmText,
                onPressed: widget.onConfirm,
              ),
          ],
        ),
      ),
    );
  }
}
