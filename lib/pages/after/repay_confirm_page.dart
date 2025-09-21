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
class RepayConfirmPage extends StatefulWidget {
  const RepayConfirmPage({super.key});

  @override
  State<RepayConfirmPage> createState() => _RepayConfirmPageState();
}

class _RepayConfirmPageState extends State<RepayConfirmPage> {
  final TextEditingController _controller = TextEditingController();
  int _inputLength = 0;
  double _comisionFee = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onInputChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged() {
    final text = _controller.text;
    final length = text.length;
    if (_inputLength != length) setState(() => _inputLength = length);
    final channel = context.read<BillDetailModel>().selectedChannel;
    final max = channel?.maxAmount ?? 0;
    //final min = channel?.minAmount ?? 0;
    final current = _controller.text.tryParseDouble ?? 0;
    if (current > max) {
      toast('msg');
      _controller.text = text.substring(0, length - 1);
    } else {
      final rate = channel?.kd94z7OChannelRate ?? 0;
      setState(() => _comisionFee = current * rate);
    }
  }

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
                  date: provider.billDetailData?.r5k31qODueTime?.showDate ?? '',
                  comision: _comisionFee,
                ),
                SizedBox(height: 12.h),
                //输入金额
                RepayConfirmInput(
                  controller: _controller,
                  inputLength: _inputLength,
                ),
                SizedBox(height: 12.h),
                //渠道
                RepayConfirmChannel(
                  channelList: provider.channelList,
                  selectedChannel: provider.selectedChannel,
                  onSelectChannel: (channel) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    provider.selectChannel(channel);
                  },
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
          FocusScope.of(context).requestFocus(FocusNode());
          final model = context.read<BillDetailModel>();
          final channel = model.selectedChannel;
          final max = channel?.maxAmount ?? 0;
          final min = channel?.minAmount ?? 0;
          final current = _controller.text.tryParseDouble ?? 0;
          if (current > max || current < min) {
            toast('msg');
            return;
          }
          final result = await PromptDialog.show(
            context: context,
            title: 'Consejos',
            content: '¿Estas seguro de modificarla cantidad?',
            confirmText: 'Confirmar',
            cancelText: 'Cancelar',
          );
          if (result == true && context.mounted) {
            model.confirmAmount(current);
            context.push(AppRouter.repayBank);
          }
        },
      ),
    );
  }
}
