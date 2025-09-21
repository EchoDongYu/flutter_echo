import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/after/bank_view/widget/bank_pay_box.dart';
import 'package:flutter_echo/pages/after/bank_view/widget/bank_step_text.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

///还款银行页面
class RepayBankPage extends StatefulWidget {
  const RepayBankPage({super.key});

  @override
  State<RepayBankPage> createState() => _RepayBankPageState();
}

class _RepayBankPageState extends State<RepayBankPage> {
  List<BankDictV0Item> bankItems = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final billModel = context.read<BillDetailModel>();
      final dict = await billModel.getBankDictionary();
      setState(() => bankItems = dict ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Pago por bancos'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
        child: Column(
          children: [
            CommonBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¿Cómo quieres pagar tu crédito?',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: NowColors.c0xFF1C1F23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  BankStepText(
                    stepNumber: '1',
                    stepText:
                        'Paga a través de comercios afiliados o condepósitos bancarios.',
                  ),
                  SizedBox(height: 16.h),
                  BankStepText(
                    stepNumber: '2',
                    stepText:
                        'Por favor, utilice el banco del que tenemos para pagar su préstamo.',
                  ),
                  SizedBox(height: 20.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bankItems.length,
                    separatorBuilder: (_, _) => SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      final itemData = bankItems[index];
                      return BankPayBox(
                        bankImage: itemData.m871v6 ?? '',
                        bankTitle: itemData.t1h91p ?? '',
                        onTap: () {
                          final billModel = context.read<BillDetailModel>();
                          billModel.selectBankDict(itemData);
                          context.push(AppRouter.repayCertificate);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            CommonBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "¿Ya realizaste tu depósito?",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: NowColors.c0xFF1C1F23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Envia tu comprobante para confirmar.",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: NowColors.c0xFF494C4F,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "El pago se completara correctamente, si ha sido verificado por el sistema.",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: NowColors.c0xFFFF9817,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Pagar inmediatamente',
        onPressed: () => context.push(AppRouter.repayCertificate),
      ),
    );
  }
}
