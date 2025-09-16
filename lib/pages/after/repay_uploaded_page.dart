
import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/uploaded_view/repay_uploaded_list_item.dart';
import 'package:flutter_echo/providers/repay_provider.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///还款已上传付款记录页面
class RepayUploadedPage extends StatelessWidget {
  const RepayUploadedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Historial de pagos subidos"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Consumer<RepayModel>(
          builder: (_, provider, _) {
            return ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return RepayUploadedListItem(status: RepayUploadedStatus.progress);
              },
            );
          },
        ),
      ),
    );
  }
}
