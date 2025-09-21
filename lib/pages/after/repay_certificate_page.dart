import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_diagram.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_info.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/dialogs/box_dialog.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

///还款凭证页面
class RepayCertificatePage extends StatefulWidget {
  const RepayCertificatePage({super.key});

  @override
  State<RepayCertificatePage> createState() => _RepayCertificatePageState();
}

class _RepayCertificatePageState extends State<RepayCertificatePage> {
  int _certificateStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(title: 'Envía comprobante'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            WidgetHelper.buildStepProgress(
              step: _certificateStep < 3 ? 1 : 2,
              maxStep: 2,
            ),
            SizedBox(height: 16.h),
            _buildCertPhoto(context),
          ],
        ),
      ),
      bottomNavigationBar: _certificateStep == 1
          ? null
          : _certificateStep == 2
          ? WidgetHelper.buildBottomButton(
              text: 'Confirmar esta imagen',
              onPressed: () async {},
            )
          : WidgetHelper.buildBottomButton(
              text: 'Enviar pago',
              onPressed: () async {
                if (_certificateStep == 1) {
                  final result = await PromptDialog.show(
                    context: context,
                    title: 'Recordatorio',
                    //content:'Excedio limite de intento de envios, por favor envíe de nuevo después de dos horas',
                    content:
                        'Por favor, no suba nuevamente el mismo comprobante.',
                    confirmText: 'Enviar el registro',
                    cancelText: 'Cerrar',
                  );
                  if (result == true && context.mounted) {}
                } else {
                  await BoxDialog.show(
                    context: context,
                    title: 'Diagrama de ejemplo de vale',
                    btnText: 'Confirmar',
                    centerLayout: RepayCertificateDiagram(),
                    onConfirm: () {
                      context.pop(true);
                    },
                  );
                }
              },
            ),
    );
  }

  Widget _buildCertPhoto(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: NowColors.c0xFFFFFFFF,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        children: [
          CommonBox(
            color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Text(
              'Confirmar tu depósito enviando una foto oimagen clara y legible de tu comprobante.',
              style: TextStyle(
                fontSize: 13.sp,
                color: NowColors.c0xFFFF9817,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          if (_certificateStep == 3)
            RepayCertificateInfo(
              onInfoTap: () {
                //图片预览
                context.push('${AppRouter.photoView}?url=${Drawable.iconLogo}');
              },
            )
          else ...[
            Image.asset(
              Drawable.iconLogo,
              width: double.infinity,
              height: 300.h,
            ),
            SizedBox(height: 28.h),
          ],
          if (_certificateStep == 1) ...[
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50.h),
                backgroundColor: NowColors.c0xFF3288F1,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Drawable.iconTake, width: 20, height: 20),
                  SizedBox(width: 10.w),
                  Text(
                    'Tomar fotografia',
                    style: TextStyle(
                      color: NowColors.c0xFFFFFFFF,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50.h),
                backgroundColor: NowColors.c0xFFFFFFFF,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                side: BorderSide(color: NowColors.c0xFFB0B1B2, width: 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Drawable.iconPhoto, width: 20, height: 20),
                  SizedBox(width: 10.w),
                  Text(
                    'Seleccionar imagen',
                    style: TextStyle(
                      color: NowColors.c0xFF1C1F23,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_certificateStep == 2)
            EchoOutlinedButton(
              text: 'Volver a subir',
              onPressed: () => setState(() => _certificateStep = 1),
            ),
        ],
      ),
    );
  }
}
