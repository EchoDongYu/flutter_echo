import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayConfirmInput extends StatelessWidget {
  final TextEditingController controller;
  final int inputLength;

  const RepayConfirmInput({
    super.key,
    required this.controller,
    required this.inputLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monto a pagar',
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 左侧固定前缀
              Text(
                'Q',
                style: TextStyle(
                  color: NowColors.c0xFF3288F1,
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(width: 12.w),
              // 中间输入框
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: NowColors.c0xFF1C1F23,
                    fontWeight: FontWeight.w600,
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: NowColors.c0xFF3288F1,
                ),
              ),
              // 右侧清除按钮
              if (inputLength > 0)
                GestureDetector(
                  onTap: () => controller.clear(),
                  child: Image.asset(Drawable.iconClear, width: 20, height: 20),
                ),
            ],
          ),
          Divider(color: NowColors.c0xFFC7C7C7, height: 1),
        ],
      ),
    );
  }
}
