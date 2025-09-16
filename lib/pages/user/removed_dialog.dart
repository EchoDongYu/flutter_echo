import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/providers/whatsapp_provider.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 删除被账号登录时提示弹窗
class RemovedDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const RemovedDialog({super.key, required this.onConfirm});

  /// 显示删除被账号登录时提示弹窗
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => ChangeNotifierProvider(
        create: (_) => WhatsappModel(),
        builder: (_, _) => PageConsumer<WhatsappModel>(
          child: RemovedDialog(onConfirm: () => context.pop(true)),
        ),
      ),
    );
  }

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
            Image.asset(Drawable.iconStatusWarn, width: 64.r, height: 64.r),
            SizedBox(height: 24.h),
            Text(
              'Aviso',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF1C1F23,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                height: 28 / 20,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'La información de tu cuenta ha sido eliminada y no puedes iniciar sesión.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF1C1F23,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 22 / 14,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.h),
              decoration: const BoxDecoration(
                color: NowColors.c0xFFF3F3F5,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text(
                'Si tiene alguna pregunta, comuníque con nuestro servicio de atención al cliente ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: NowColors.c0xFF494C4F,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  height: 18 / 13,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            InkWell(
              onTap: () async {
                final phone = await context
                    .read<WhatsappModel>()
                    .getDictionary();
                FlutterPlatform.launchWhatsApp(phone);
              },
              child: Text(
                'Suporte via WhatsApp',
                style: TextStyle(
                  color: NowColors.c0xFF3288F1,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 22 / 14,
                  decoration: TextDecoration.underline,
                  decorationColor: NowColors.c0xFF3288F1,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            EchoPrimaryButton(text: 'Entendi', onPressed: onConfirm),
          ],
        ),
      ),
    );
  }
}
