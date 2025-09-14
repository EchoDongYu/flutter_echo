import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 授权声明补偿弹窗
class CompensationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onClosing;

  const CompensationDialog({
    super.key,
    required this.onConfirm,
    required this.onClosing,
  });

  /// 显示授权声明补偿弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: CompensationDialog(
          onConfirm: () => context.pop(true),
          onClosing: () => context.pop(false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: onClosing,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          Text(
            'Solicitud de permiso',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 24 / 18,
            ),
          ),
          SizedBox(height: 28.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 22 / 14,
                ),
                children: [
                  const TextSpan(
                    text:
                        'Por favor permita todos los permisos de acceso a datos móviles (Ubicación, etc.) para aumentar sus posibilidades de aprobación.'
                        '\n\nNos aseguraremos de que sus datos estén protegidos según los estándares estrictos y se eliminen de nuestros servidores cuando lo solicite.'
                        '\n\nRevise nuestras ',
                    style: TextStyle(color: NowColors.c0xFF494C4F),
                  ),
                  TextSpan(
                    text: 'Política de privacidad',
                    style: TextStyle(
                      color: NowColors.c0xFF3288F1,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.pushH5Privacy(),
                  ),
                  const TextSpan(
                    text: ' y el ',
                    style: TextStyle(color: NowColors.c0xFF494C4F),
                  ),
                  TextSpan(
                    text: 'Acuerdo de servicio',
                    style: TextStyle(
                      color: NowColors.c0xFF3288F1,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.pushH5Service(),
                  ),
                  const TextSpan(
                    text: ' obtener más información.',
                    style: TextStyle(color: NowColors.c0xFF494C4F),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 36.h),
          WidgetHelper.buildBottomButton(text: 'OK', onPressed: onConfirm),
        ],
      ),
    );
  }
}
