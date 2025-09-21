import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_amount.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_channel.dart';
import 'package:flutter_echo/pages/after/confirm_view/repay_confirm_input.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 还款确认页面
class RepayConfirmPage extends StatelessWidget {
  const RepayConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Metodo de pago'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Consumer<BillDetailModel>(
          builder: (_, provider, child) {
            return Column(
              children: [
                //顶部提示
                child!,
                SizedBox(height: 12.h),
                //应付金额
                RepayConfirmAmount(
                  amount: provider.totalAmount?.showAmount ?? '',
                  comision: provider.businessFee?.showAmount ?? '',
                  date: provider.billDetailData?.r5k31qODueTime?.showDate ?? '',
                ),
                SizedBox(height: 12.h),
                //输入金额
                RepayConfirmInput(onChanged: (v) => provider.inputAmount(v)),
                SizedBox(height: 12.h),
                //渠道
                RepayConfirmChannel(
                  channelList: provider.channelList,
                  selectedChannel: provider.selectedChannel,
                  onSelectChannel: (v) => provider.selectChannel(v),
                ),
              ],
            );
          },
          child: CommonBox(
            color: NowColors.c0xFFFF9817.withValues(alpha: 0.1),
            child: Text(
              "Estimado usuario, CashiGO mantendra sus datos seguros y no los compartira con tercero",
              style: TextStyle(
                fontSize: 14.sp,
                color: NowColors.c0xFFFF9817,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        onPressed: () async {
          final result = await PromptDialog.show(
            context: context,
            title: 'Consejos',
            content: '¿Estas seguro de modificarla cantidad?',
            confirmText: 'Confirmación',
            cancelText: 'Cancelar',
          );
          if (result == true && context.mounted) {
            context.push(AppRouter.repayBank);
          }
        },
      ),
    );
  }
}
