import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 添加银行卡弹窗
class StepBankDialog extends StatefulWidget {
  final VoidCallback onClosing;
  final VoidCallback onConfirm;

  const StepBankDialog({
    super.key,
    required this.onClosing,
    required this.onConfirm,
  });

  /// 显示添加银行卡弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => StepBankDialog(
        onConfirm: () => context.pop(true),
        onClosing: () => context.pop(false),
      ),
    );
  }

  @override
  State<StepBankDialog> createState() => _StepBankDialogState();
}

class _StepBankDialogState extends State<StepBankDialog> {
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
                  'Conta Bancaria',
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
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'El titular de la tarjeta debe estar debajo de la CUI (123312321) que completó cuando presentó la solicitud; ',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF494C4F,
                height: 20 / 13,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          _buildFormArea(),
          SizedBox(height: 36.h),
        ],
      ),
    );
  }

  final TextEditingController _controller = TextEditingController();
  Map<int, List<StepItem>?>? _stepItems;
  Map<int, StepItem?>? _pickedItem;

  /// 构建表单区域
  Widget _buildFormArea() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        spacing: 12.h,
        children: [
          StepSelectField.pickItem(
            context,
            items: _stepItems?[0],
            pickedItem: _pickedItem?[0],
            onValueChange: (value) => setState(() => _pickedItem?[0] = value),
            hintText: 'Banco',
            isError: false,
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[1],
            pickedItem: _pickedItem?[1],
            onValueChange: (value) => setState(() => _pickedItem?[1] = value),
            hintText: 'Elige su tipo de cuenta',
            isError: false,
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Número de cuenta bancaria',
            maxLength: 13,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Confirma su cuenta bancaria nuevamente',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
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
        text: 'Vincular la tarjeta bancaria',
        onPressed: widget.onConfirm,
      ),
    );
  }
}
