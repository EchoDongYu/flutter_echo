import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_diagram.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_info.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_payment.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_photo.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_support.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/dialogs/box_dialog.dart';
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
    //凭证步骤 1-上传凭证 2-信息填写
    final indexCertificate = 2;
    return Scaffold(
      appBar: CommonAppBar(title: 'Envía comprobante'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: indexCertificate == 1 ? Column(
          children: [
            WidgetHelper.buildStepProgress(step: 1, maxStep: 2),
            SizedBox(height: 16.h),
            RepayCertificatePhoto(
              onPhotoTap: () {
                //图片预览
                context.push('${AppRouter.photoView}?url=${Drawable.iconLogo}',);
              },
              onTakePressed: () {},
              onPhotoPressed: () {},
            ),
          ],
        ) : Column(
          children: [
            WidgetHelper.buildStepProgress(step: 2, maxStep: 2),
            SizedBox(height: 16.h),
            RepayCertificateInfo(
              onPhotoTap: () {
                //跳转图片预览
                context.push('${AppRouter.photoView}?url=${Drawable.iconLogo}',);
              },
            ),
            SizedBox(height: 12.h),
            RepayCertificatePayment(),
            SizedBox(height: 32.h),
            RepayCertificateSupport(
              onUploaded: (){
                //跳转还款已上传付款记录
                context.push(AppRouter.repayUploaded);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: indexCertificate == 1 ? 'Confirmar esta imagen' : 'Enviar pago',
        onPressed: () async {
          if( indexCertificate == 1 ){
            final result = await PromptDialog.show(
              context: context,
              title: 'Recordatorio',
              //content:'Excedio limite de intento de envios, por favor envíe de nuevo después de dos horas',
              content: 'Por favor, no suba nuevamente el mismo comprobante.',
              confirmText: 'Enviar el registro',
              cancelText: 'Cerrar',
            );
            if (result == true && context.mounted) {
              //跳转还款状态页面
              //todo ?? 跳转那里？
              //context.push(AppRouter.repayProcess);
            }
          }else{
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
}
