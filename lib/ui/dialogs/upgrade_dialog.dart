import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// 版本升级弹窗
class UpgradeDialog extends StatelessWidget {
  final bool force;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const UpgradeDialog({
    super.key,
    required this.force,
    required this.onConfirm,
    required this.onCancel,
  });

  /// 显示版本升级弹窗
  static Future<bool?> show(BuildContext context, bool force) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => UpgradeDialog(
        force: force,
        onConfirm: () {
          //if (!force) context.pop(true);
          launchUrl(
            Uri.parse(
              'https://play.google.com/store/apps/details?id=${AppConst.applicationId}',
            ),
          );
        },
        onCancel: () => context.pop(false),
      ),
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Image.asset(
                  Drawable.imageUpgrade,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Text(
                        'Notificación de actualización',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF1C1F23,
                          height: 30 / 20,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'CashiGO ha lanzado nuevas funciones. Haga clic en [Actualizar] y luego elija cualquier navegador o Google Play. Si no recibe la pantalla en segundos, aún puede abrir manualmente Google Play y buscar CashiGO para actualizar la APLICACIÓN.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: NowColors.c0xFF494C4F,
                          height: 22 / 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      EchoPrimaryButton(
                        text: 'Actualizar',
                        onPressed: onConfirm,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!force) ...[
            SizedBox(height: 36.h),
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
        ],
      ),
    );
  }
}
