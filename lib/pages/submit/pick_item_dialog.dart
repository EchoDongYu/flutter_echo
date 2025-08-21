import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 认证项选择弹窗
class PickItemDialog extends StatefulWidget {
  final VoidCallback onClosing;
  final Function(StepItem?) onConfirm;
  final List<StepItem> items;
  final StepItem? pickedItem;

  const PickItemDialog({
    super.key,
    required this.onClosing,
    required this.onConfirm,
    required this.items,
    this.pickedItem,
  });

  @override
  State<PickItemDialog> createState() => _PickItemDialogState();
}

class _PickItemDialogState extends State<PickItemDialog> {
  StepItem? _pickedItem;

  @override
  void initState() {
    super.initState();
    _pickedItem = widget.pickedItem;
  }

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
            height: 56.h,
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
                Text(
                  'This is title This is title',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 18,
                  ),
                ),
                SizedBox(width: 24.r, height: 24.r),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 30.h),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return _buildPickItem(widget.items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickItem(StepItem item) {
    final isSelected = item == _pickedItem;
    return InkWell(
      onTap: () => setState(() => _pickedItem = item),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: NowStyles.cardShadows,
        ),
        child: Row(
          children: [
            Image.asset(
              R.drawable(
                isSelected ? 'icon_select_on.png' : 'icon_select_off.png',
              ),
              width: 22.r,
              height: 22.r,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                item.value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  color: NowColors.c0xFF1C1F23,
                  height: 22 / 14,
                ),
              ),
            ),
          ],
        ),
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
        onPressed: () => widget.onConfirm.call(_pickedItem),
      ),
    );
  }
}
