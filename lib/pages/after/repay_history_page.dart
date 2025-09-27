import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/after/history_view/repay_history_item.dart';
import 'package:flutter_echo/providers/repay_history_provider.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/page_no_data.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///还款历史页面
class RepayHistoryPage extends StatelessWidget {
  final String? loanGid;

  const RepayHistoryPage({super.key, this.loanGid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(title: 'Historial de pagos'),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<RepayHistoryModel>().fetchRepayListData(loanGid);
        },
        child: Consumer<RepayHistoryModel>(
          builder: (_, provider, _) {
            final historyList = provider.historyList;
            if (historyList == null) return SizedBox();
            if (historyList.isEmpty) return const PageNoData();
            return ListView.separated(
              itemCount: historyList.length,
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 20.h),
              separatorBuilder: (_, _) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final itemData = historyList[index];
                return RepayHistoryItem(
                  amount: itemData.gatemanORepaymentAmount ?? 0.0,
                  venDate: itemData.wtpuztORepaymentTime?.showDate ?? '',
                  status: itemData.pyreneesOPayStatus,
                  type: itemData.type,
                  id: itemData.r5a4x8OLoanGid,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
