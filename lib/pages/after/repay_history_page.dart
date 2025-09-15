import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/after/history_view/repay_history_list_item.dart';
import 'package:flutter_echo/providers/repay_provider.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///还款历史页面
class RepayHistoryPage extends StatelessWidget {
  const RepayHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Historial de pagos"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Consumer<RepayModel>(
          builder: (_, provider, _) {
            return Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  return RepayHistoryListItem(status: RepayHistoryStatus.pagos);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
