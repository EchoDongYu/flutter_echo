import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/after/centificate_view/repay_certificate_item.dart';
import 'package:flutter_echo/providers/repay_cert_provider.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///凭证记录页面
class CertRecordPage extends StatelessWidget {
  const CertRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(title: 'Historial de pagos subidos'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Consumer<RepayCertModel>(
          builder: (_, provider, _) {
            return ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return RepayCertificateItem(
                  status: RepayCertificateStatus.progress,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
