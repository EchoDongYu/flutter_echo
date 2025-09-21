import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/face/face_guide_dialog.dart';
import 'package:flutter_echo/pages/face/face_view/face_id_info_dpi.dart';
import 'package:flutter_echo/pages/face/face_view/face_id_info_facial.dart';
import 'package:flutter_echo/pages/face/face_view/face_id_info_tips.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 授信证件信息页面
class FaceIdInfoPage extends StatelessWidget {
  const FaceIdInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Autenticación de identidad"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            WidgetHelper.buildStepProgress(step: 4, maxStep: 4),
            SizedBox(height: 16.h),
            FaceIdInfoTips(),
            SizedBox(height: 12.h),
            FaceIdInfoDpi(
              dpiTitle: 'Foto del frente del DPI',
              dpiBackTitle: 'Foto del reverso del DPI',
              dpiTap: (){
                _showStepFaceIdDialog(context,1);
              },
              dpiBackTap: (){
                _showStepFaceIdDialog(context,2);
              },
            ),
            SizedBox(height: 12.h),
            FaceIdInfoFacial(
              dpiFaceTitle: 'Foto facial',
              dpiFaceTap: (){
                context.push(AppRouter.faceIdentification);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: "Enviar",
        onPressed: () async {},
      ),
    );
  }

  Future<void> _showStepFaceIdDialog(BuildContext context,int type) async {
    // 1-身份证正面，2-身份证反面
    final result = await FaceGuideDialog.show(context,type);
    if (context.mounted) {
      if (result == true) {

      } else {

      }
    }
  }
}
