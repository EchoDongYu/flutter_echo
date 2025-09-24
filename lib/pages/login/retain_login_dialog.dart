import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 退出输入手机号页面挽留弹窗
class RetainLoginDialog extends StatelessWidget {
  final VoidCallback onAgree;
  final VoidCallback onDisagree;

  const RetainLoginDialog({
    super.key,
    required this.onAgree,
    required this.onDisagree,
  });

  /// 显示退出输入手机号页面挽留弹窗
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => RetainLoginDialog(
        onAgree: () => context.pop(true),
        onDisagree: () => context.pop(false),
      ),
    );
  }

  static const retainItems = [
    Pair(Drawable.iconRetainLogin1, 'Hasta Q 5,000 '),
    Pair(
      Drawable.iconRetainLogin2,
      'Aumente rápidamente el límite de crédito hasta 4 veces',
    ),
    Pair(Drawable.iconRetainLogin3, 'En 5 minutos puede obtener el crédito'),
  ];

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
              'A un paso de obtener un préstamo',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 30 / 20,
              ),
              textAlign: TextAlign.center,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                itemCount: retainItems.length,
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  return _buildRetainItem(retainItems[index]);
                },
              ),
            ),
            SafeArea(child: _buildBottomButtons()),
          ],
        ),
      ),
    );
  }

  Widget _buildRetainItem(Pair item) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: NowColors.c0xFFEFF7FF,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        spacing: 12.w,
        children: [
          Image.asset(item.first, width: 40.r, height: 40.r),
          Expanded(
            child: Text(
              item.second,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 22 / 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建底部按钮
  Widget _buildBottomButtons() {
    return Row(
      children: [
        // 不同意按钮
        Expanded(
          child: EchoOutlinedButton(text: 'Abandonar', onPressed: onDisagree),
        ),
        SizedBox(width: 12.w),
        // 同意按钮
        Expanded(
          child: EchoPrimaryButton(text: 'Continuar', onPressed: onAgree),
        ),
      ],
    );
  }
}
