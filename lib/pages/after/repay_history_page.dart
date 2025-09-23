import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/after/history_view/repay_history_item.dart';
import 'package:flutter_echo/providers/repay_history_provider.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/page_no_data.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///还款历史页面
class RepayHistoryPage extends StatelessWidget {
  const RepayHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyModel = context.watch<RepayHistoryModel>();
    final historyList = historyModel.historyList;
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(title: 'Historial de pagos'),
      body: RefreshIndicator(
        onRefresh: () => context.read<RepayHistoryModel>().fetchRepayListData(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (historyList != null)
                historyList.isNotEmpty == true
                    ? HistoryListView(historyList: historyList)
                    : const PageNoData(),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryListView extends StatelessWidget {
  final List<BillRepayResp$My4dd2ORepaymentList$Item> historyList;

  const HistoryListView({super.key, required this.historyList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: historyList.length,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        separatorBuilder: (_, _) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final itemData = historyList[index];
          return RepayHistoryItem(
            amount: itemData.gatemanORepaymentAmount ?? 0.0,
            venDate: itemData.wtpuztORepaymentTime?.showDate ?? '',
            status: itemData.d95091ORepaymentStatus,
          );
        },
      ),
    );
  }
}
