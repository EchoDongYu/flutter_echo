import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/bill/list_view/bill_list_item.dart';
import 'package:flutter_echo/pages/bill/list_view/bill_list_no_data.dart';
import 'package:flutter_echo/pages/bill/list_view/bill_list_top_card.dart';
import 'package:flutter_echo/providers/bill_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

///账单列表
class BillListPage extends StatelessWidget {
  const BillListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final billProvider = context.watch<BillModel>();
    final billList = billProvider.billListData ?? [];
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Cuentas'),
                RefreshIndicator(
                  onRefresh: ()=> context.read<BillModel>().fetchBillListData(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BillListTopCard(
                          title: 'Cantidad reciblda (Q)',
                          value: '${billProvider.totalAmount}',
                        ),
                        billList.isNotEmpty
                            ? BillListView(billListData :billList)
                            : BillListNoData(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BillListView extends StatelessWidget {
  const BillListView({super.key, required this.billListData});

  final List<BillListResp$SoberOBillList$Item> billListData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: billListData.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final itemData = billListData.elementAtOrNull(index);
        //订单展示状态(o_orderStatus)：,0打款中,1打款失败,2打款成功且未结清未逾期,3打款成功且未结清有逾期,4全结清
        return BillListItem(
          amount: 5000,
          vencimientoDate: "28/06/2024",
          dueDate: "05/01/2024",
          status:PaymentStatus.pending,
          onDetails: () {
            context.push(AppRouter.billDetail);
          },
          onPay: () {

          },
        );
      },
    );
  }
}
