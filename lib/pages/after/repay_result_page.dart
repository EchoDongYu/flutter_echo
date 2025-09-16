import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/common_appbar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

///还款状态页面-失败
class RepayFailedPage extends StatelessWidget {
  const RepayFailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(title: "Resultado del Pagar"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(28.w, 64.h, 28.w, 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                Drawable.iconStatusWrong3,
                width: 70.r,
                height: 70.r,
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'Pago fallido',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFFFB4F34,
                  height: 34 / 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Aviso: Pago fallido, verifique si ha completado el pago',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF1C1F23,
                height: 22 / 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomFailedButton(
        text: 'Volver a la de inicio',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }
}

///还款状态页面-处理中
class RepayProcessPage extends StatelessWidget {
  const RepayProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      appBar: CommonAppBar(title: "Resultado del Pagar"),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(28.w, 64.h, 28.w, 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                Drawable.iconStatusOn3,
                width: 70.r,
                height: 70.r,
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'Pago pendiente',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 34 / 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Su solicitud de pago está en proceso, le notificaremos por SMS apena que se actualice.',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF1C1F23,
                height: 22 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            Divider(),
            SizedBox(height: 16.h),
            Text(
              'Estimado cliente:',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 22 / 14,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Por favor, tome en cuenta que las transacciones de pago realizadas durante fines de semana o días festivos podrían procesarse hasta el siguiente día hábil. La plataforma registrará la cancelación de su factura de pago con base en la fecha real de acreditación de los fondos, sin afectar su historial crediticio, por lo que puede estar tranquilo.',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF494C4F,
                height: 18 / 13,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Volver al inicio',
        //todo ?? 跳转那里？
        onPressed: () => context.push(AppRouter.repayBank),
      ),
    );
  }
}
