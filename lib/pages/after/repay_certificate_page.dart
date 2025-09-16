import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_photo.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///还款凭证页面
class RepayCertificatePage extends StatelessWidget {
  const RepayCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Envía comprobante",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            WidgetHelper.buildStepProgress(step: 1,maxStep: 2),
            SizedBox(height: 16.h),
            RepayCertificatePhoto(),
          ],
        ),
      ),
    );
  }
}
