import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_photo.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

///还款凭证页面
class RepayCertificatePage extends StatelessWidget {
  const RepayCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Envía comprobante"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            WidgetHelper.buildStepProgress(step: 1, maxStep: 2),
            SizedBox(height: 16.h),
            RepayCertificatePhoto(
              onPhotoTap: () {
                //图片预览
                context.push("${AppRouter.photoView}?url=${Drawable.iconLogo}",);
              },
              onTakePressed: () {},
              onPhotoPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Confirmar esta imagen',
        onPressed: () async {
          final result = await PromptDialog.show(
            context: context,
            title: 'Recordatorio',
            //content:"Excedio limite de intento de envios, por favor envíe de nuevo después de dos horas",
            content: "Por favor, no suba nuevamente el mismo comprobante.",
            confirmText: 'Enviar el registro',
            cancelText: "Cerrar",
          );
          if (result == true && context.mounted) {
            //跳转还款状态页面
            //todo ?? 跳转那里？
            //context.push(AppRouter.repayProcess);
          }
        },
      ),
    );
  }
}
