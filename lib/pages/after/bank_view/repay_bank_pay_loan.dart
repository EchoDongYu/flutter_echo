import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/after/bank_view/widget/bank_pay_box.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/pages/after/bank_view/widget/bank_step_text.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RepayBankPayLoan extends StatelessWidget {
  const RepayBankPayLoan({super.key});

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
            stepText:
                "Paga a través de comercios afiliados o condepósitos bancarios.",
          ),
          SizedBox(height: 16.h),
          BankStepText(
            stepNumber: "2",
            stepText:
                "Por favor, utilice el banco del que tenemos para pagar su préstamo.",
          ),
          SizedBox(height: 20.h),
          BankPayBox(
            backImageUrl: Drawable.iconBankGT,
            backTitle: "Banco G&T continental",
            onTap: (){
              context.push(AppRouter.repayBankGT);
            },
          ),
          SizedBox(height: 10.h),
          BankPayBox(
            backImageUrl: Drawable.iconBankBAC,
            backTitle: "Banco BAC",
            onTap: (){
              context.push(AppRouter.repayBankBAC);
            },
          ),
          SizedBox(height: 10.h),
          BankPayBox(
            backImageUrl: Drawable.iconBankBI,
            backTitle: "BANCO INDUSTRIAL",
            onTap: (){
              context.push(AppRouter.repayBankBI);
            },
          ),
        ],
      ),
    );
  }
}
