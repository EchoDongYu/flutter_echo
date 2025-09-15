import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/pages/after/bank_view/widget/bank_step_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayBankPayTips extends StatelessWidget {
  const RepayBankPayTips({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "¿Cómo quieres pagar tu crédito?",
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          BankStepText(
            stepNumber: "1",
            stepText: "Deposita en efectivo o transfiere a nuestra cuenta.",
          ),
          SizedBox(height: 16.h),
          BankStepText(
            stepNumber: "2",
            stepText:
                "cuando realice la transferencia por favor en la NOTA colocar el siguiente numero de telefono (952374155)",
          ),
          SizedBox(height: 16.h),
          BankStepText(
            stepNumber: "3",
            stepText:
                "Envia una foto o captura de tu comprobante desde la app CashiGO",
          ),
          SizedBox(height: 16.h),
          BankStepText(
            stepNumber: "4",
            stepText:
                "Después de que sube el comprobante, el sistema será validara el mismo día, si la validacion se retrasa reducirá automáticamente el coste de intereses que genera.",
          ),
        ],
      ),
    );
  }
}
