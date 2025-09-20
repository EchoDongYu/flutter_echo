import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
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
    final billList = billModel.billListData ?? [];
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: const CommonAppBar(title: "Cuentas"),
      body: RefreshIndicator(
        onRefresh: () => context.read<BillModel>().fetchBillListData(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer<BillModel>(
                builder: (_, billModel, _) {
                  return BillListTopCard(
                    title: 'Cantidad recibida (Q)',
                    value: billModel.totalAmount.showAmount,
                  );
                },
              ),
              billList.isNotEmpty ? const BillListView() : const PageNoData(),
            ],
          ),
        ),
      ),
    );
  }
}

class BillListView extends StatelessWidget {
  const BillListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BillModel>(
      builder: (_, provider, _) {
        final billList = provider.billListData ?? [];
        return Expanded(
          child: ListView.separated(
            itemCount: billList.length,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final billInfo = billList[index];
              final planList = billInfo.outdoOPlanSimpleList ?? [];
              return BillListItem(
                amount: billInfo.kinkyOOrderAmount ?? 0.0,
                dueDays: billInfo.coandaODueDays ?? 0,
                vencimientoDate: billInfo.encloseOOrderTime?.showDate ?? "",
                status: billStatus(billInfo.cherubimOOrderStatus),
                billListItemBox: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: planList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return WidgetHelper.buildPlanItem(
                      '${planList[index].ih2upqOCtPeriod}/${planList[index].ez64t7OPeriodCount}',
                      planList[index].r5k31qODueTime,
                      planList[index].wantonlyOLoanLeftAmount,
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
      },
    );
  }
}

//订单展示状态(产品工厂改版新增)：,0打款中,1打款失败,2打款成功且未结清未逾期,3打款成功且未结清有逾期,4全结清
BillStatus billStatus(int? status) {
  switch (status) {
    case 0:
      return BillStatus.pendiente;
    case 1:
      return BillStatus.fracaso;
    case 2:
      return BillStatus.pagos;
    case 3:
      return BillStatus.atrasado;
    case 4:
      return BillStatus.pagado;
    default:
      return BillStatus.pendiente;
  }
}

String routeDetails(int? status, String? id) {
  switch (status) {
    case 0:
      return AppRouter.applyProcess;
    case 1:
      return AppRouter.applyFailed;
    case 2:
    case 3:
    case 4:
      //跳转账单详情
      return Uri(
        path: AppRouter.billDetail,
        queryParameters: {NavKey.id: id.toString()},
      ).toString();
    default:
      return AppRouter.applyProcess;
  }
}
