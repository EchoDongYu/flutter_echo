import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 认证项选择日期弹窗
class PickDateDialog extends StatefulWidget {
  final VoidCallback onClosing;
  final Function(DateTime?) onConfirm;
  final String title;

  const PickDateDialog({
    super.key,
    required this.onClosing,
    required this.onConfirm,
    required this.title,
  });

  /// 显示认证项选择日期弹窗
  static Future<DateTime?> show(BuildContext context, {required String title}) {
    return showModalBottomSheet<DateTime>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => PickDateDialog(
        onConfirm: (value) => context.pop(value),
        onClosing: () => context.pop(),
        title: title,
      ),
    );
  }

  @override
  State<PickDateDialog> createState() => _PickDateDialogState();
}

class _PickDateDialogState extends State<PickDateDialog> {
  DateTime? _pickedDate;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: widget.onClosing,
      enableDrag: false,
      backgroundColor: NowColors.c0xFFF3F3F5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildContent(), _buildBottomButton()],
      ),
    );
  }

  /// 构建主要内容区域
  Widget _buildContent() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 528.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: widget.onClosing,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: 24.r,
                    height: 24.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: BoxBorder.all(
                        color: NowColors.c0xFF1C1F23,
                        width: 1.6.w,
                      ),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: NowColors.c0xFF1C1F23,
                      size: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                        height: 24 / 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 24.r, height: 24.r),
              ],
            ),
          ),
          CalendarDatePicker(
            initialDate: DateTime.now().subtract(
              const Duration(days: 365 * 20),
            ),
            firstDate: DateTime(1900, 1, 1),
            lastDate: DateTime.now(),
            onDateChanged: (date) => setState(() => _pickedDate = date),
          ),
        ],
      ),
    );
  }

  /// 构建底部按钮
  Widget _buildBottomButton() {
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
        text: 'Confirmar',
        onPressed: () => widget.onConfirm.call(_pickedDate),
      ),
    );
  }
}
