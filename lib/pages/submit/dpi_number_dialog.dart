import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 证件号码弹窗
class DpiNumberDialog extends StatelessWidget {
  final VoidCallback onCancel;

  const DpiNumberDialog({super.key, required this.onCancel});

  /// 显示证件号码弹窗
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => DpiNumberDialog(onCancel: () => context.pop(false)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Text(
                  'Numero de CUI',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 18,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 16.h, bottom: 22.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(color: NowColors.c0xFFFFF9EA),
                  child: Text(
                    'El numero de serie se solicita para verlificacion de identidad de nuestro sistema. Tus datos ostan seguros, tal ycomo lo dice nuestra politica do privacidad',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFFFF9817,
                      height: 18 / 13,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Image.asset(
                    Drawable.imageDpi,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          InkWell(
            onTap: onCancel,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Container(
              width: 28.r,
              height: 28.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(color: Colors.white, width: 1.6.w),
              ),
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
