import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 认证项选择弹窗
class PickBankDialog extends StatefulWidget {
  final VoidCallback onClosing;
  final Function(BankVOResp$Item?) onConfirm;
  final List<BankVOResp$Item> items;
  final BankVOResp$Item? pickedItem;
  final String title;

  const PickBankDialog({
    super.key,
    required this.onClosing,
    required this.onConfirm,
    required this.items,
    this.pickedItem,
    required this.title,
  });

  /// 显示认证项选择弹窗
  static Future<BankVOResp$Item?> show(
    BuildContext context, {
    List<BankVOResp$Item>? items,
    BankVOResp$Item? pickedItem,
    required String title,
  }) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => PickBankDialog(
        onConfirm: (item) => context.pop(item),
        onClosing: () => context.pop(),
        items: items ?? List.empty(),
        pickedItem: pickedItem,
        title: title,
      ),
    );
  }

  @override
  State<PickBankDialog> createState() => _PickBankDialogState();
}

class _PickBankDialogState extends State<PickBankDialog> {
  BankVOResp$Item? _pickedItem;

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

  Widget _buildPickItem(BankVOResp$Item item) {
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
              isSelected ? Drawable.iconSelectOn : Drawable.iconSelectOff,
              width: 22.r,
              height: 22.r,
            ),
            SizedBox(width: 10.w),
            CachedNetworkImage(
              imageUrl: item.m871v6OBankLogo ?? '',
              height: 36.h,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                item.t1h91pOBankName ?? '',
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
