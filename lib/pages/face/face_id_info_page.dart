
import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 授信证件信息页面
class FaceIdInfoPage extends StatelessWidget {
  const FaceIdInfoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CommonAppBar(title: "Autenticación de identidad"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child:  Column(
          children: [
            WidgetHelper.buildStepProgress(step: 1, maxStep: 2),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text:  "Enviar",
        onPressed: () async {

        },
      ),
    );
  }
}
