import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/bill/bill_status.dart';
import 'package:flutter_echo/pages/bill/list_view/bill_list_item.dart';
import 'package:flutter_echo/pages/bill/list_view/bill_list_top_card.dart';
import 'package:flutter_echo/providers/bill_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/page_no_data.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

///账单列表
class BillListPage extends StatelessWidget {
  const BillListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final billModel = context.watch<BillModel>();
    final billList = billModel.historyList;
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: const CommonAppBar(title: 'Cuentas'),
      body: RefreshIndicator(
        onRefresh: () => context.read<BillModel>().fetchBillListData(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BillListTopCard(
                title: 'Cantidad recibida (Q)',
                value: billModel.totalAmount?.showAmount ?? '',
              ),
              if (billList != null)
                billList.isNotEmpty == true
                    ? BillListView(billList: billList)
                    : const PageNoData(),
            ],
          ),
        ),
      ),
    );
  }
}

class BillListView extends StatelessWidget {
  final List<LoanBillResp$Ouxtd3OLoanList$Item> billList;

  const BillListView({super.key, required this.billList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: billList.length,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        separatorBuilder: (_, _) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final billInfo = billList[index];
          final planList = billInfo.outdoOPlanSimpleList ?? [];
          return BillListItem(
            amount: billInfo.kinkyOOrderAmount ?? 0.0,
            dueDays: billInfo.coandaODueDays ?? 0,
            venDate: billInfo.encloseOOrderTime?.showDate ?? '',
            status: billStatus(billInfo.cherubimOOrderStatus),
            planListBox: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: planList.length,
              separatorBuilder: (_, _) => SizedBox(height: 10.h),
              itemBuilder: (_, index) {
                final planItem = planList[index];
                return WidgetHelper.buildPlanItem(
                  '${planItem.ih2upqOCtPeriod}/${planItem.ez64t7OPeriodCount}',
                  first: planItem.r5k31qODueTime,
                  second: planItem.wantonlyOLoanLeftAmount ?? 0,
                  color: planColor(planItem.i2jk5fOPeriodStatus),
                );
              },
            ),
            onDetails: () {
              final route = routeDetails(
                billInfo.cherubimOOrderStatus,
                billInfo.r5a4x8OLoanGid,
              );
              context.push(route);
            },
            onPagar: () {
              //跳转还款页面
              final uriRoute = Uri(
                path: AppRouter.repayConfirm,
                queryParameters: {
                  NavKey.id: billInfo.r5a4x8OLoanGid.toString(),
                },
              );
              context.push(uriRoute.toString());
            },
          );
        },
      ),
    );
  }
}
