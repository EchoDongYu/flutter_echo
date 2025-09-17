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
    final totalAmount = billModel.totalAmount;
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
              BillListTopCard(
                title: 'Cantidad reciblda (Q)',
                value: '$totalAmount',
              ),
              SizedBox(height: 12.h),
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
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final itemData = billList[index];
              final planList = itemData.outdoOPlanSimpleList;
              if (planList == null) return SizedBox();
              final length = planList.length;
              return BillListItem(
                amount: itemData.retiaryOLoanAmount ?? 0.0,
                vencimientoDate: itemData.r5k31qODueTime?.showDate ?? "",
                status: updateBillStatus(itemData.suffOLoanStatus),
                billListItemBox: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return WidgetHelper.buildPlanItem(
                      '${index + 1}/$length',
                      planList[index].r5k31qODueTime,
                      planList[index].wantonlyOLoanLeftAmount,
                    );
                  },
                ),
                onDetails: () {
                  context.push(AppRouter.applyProcess);
                },
                onPagar: () {
                  //跳转还款页面
                  //context.push(AppRouter.repayConfirm);
                },
              );
            },
          ),
        );
      },
    );
  }
}

//订单展示状态(o_orderStatus)：,0打款中,1打款失败,2打款成功且未结清未逾期,3打款成功且未结清有逾期,4全结清
BillStatus updateBillStatus(int? d95091oRepaymentStatus) {
  return BillStatus.pendiente;
}
