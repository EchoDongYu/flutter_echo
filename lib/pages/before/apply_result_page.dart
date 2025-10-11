import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/apply_process_provider.dart';
import 'package:flutter_echo/services/praise_service.dart';
import 'package:flutter_echo/ui/dialog_helper.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 借款失败页面
class ApplyFailedPage extends StatelessWidget {
  const ApplyFailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Resultado del préstamo'),
                Expanded(
                  child: SingleChildScrollView(
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
                            'Error en el préstamo',
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
                          'Lamentamos informarle de que actualmente no podemos concederle el préstamo solicitado. Esto se debe a que no podemos obtener suficiente información de su expediente de crédito. Le invitamos sinceramente a que vuelva y solicite un préstamo más adelante.',
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
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomFailedButton(
        text: 'Volver a la de inicio',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }
}

/// 借款处理中页面
class ApplyProcessPage extends StatefulWidget {
  const ApplyProcessPage({super.key});

  @override
  State<StatefulWidget> createState() => ApplyProcessPageState();
}

class ApplyProcessPageState extends State<ApplyProcessPage> {
  final PraiseService _praiseService = PraiseService();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final model = context.read<ApplyProcessModel>();
      CheckFirstLoanResp? resp = await model.queryFirstLoan();
      if (resp?.tassesOPopUpNotice == true && mounted) {
        int? result = await _showPraiseDialog();
        if (result == 1) {
          //启动好评
          _praiseService.requestReview();
        } else if (result == 2) {
          //意见反馈
          if (mounted) {
            context.push(AppRouter.feedback);
          }
        }
      }
    });
  }

  Future<int?> _showPraiseDialog() async {
    return await DialogHelper.showPraiseDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Resultado del préstamo'),
                Expanded(
                  child: SingleChildScrollView(
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
                            'Préstamo en proceso',
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
                          'Tu solicitud de préstamo se está procesando y te notificaremos por mensaje de texto una vez terminado el proceso.',
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
                          'Debido al tiempo de procesamiento del sistema bancario, los pagos realizados durante fines de semana o días festivos podrían acreditarse hasta el siguiente día hábil. La fecha de vencimiento de su factura se ajustará automáticamente según el momento en que se reciban los fondos, por lo que puede estar tranquilo.',
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
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Volver a la de inicio',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }
}
