import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/step_status_provider.dart';
import 'package:flutter_echo/providers/whatsapp_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 授信失败页面
class StepFailedPage extends StatelessWidget {
  const StepFailedPage({super.key});

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
                EchoTopBar(title: 'Autorizacion'),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(28.w, 64.h, 28.w, 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            Drawable.iconStatusWrong2,
                            width: 70.r,
                            height: 70.r,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Center(
                          child: Text(
                            'Error en la autorización',
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
                          'Lamentamos que su solicitud de préstamo no cumpla los requisitos actuales, pero eso no significa que tenga un problema de crédito.',
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
                          '¿Qué puedo hacer ahora?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: NowColors.c0xFF1C1F23,
                            height: 22 / 14,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Hemos tenido en cuenta muchos factores en su solicitud de préstamo. Desgraciadamente, esta vez no se lo hemos concedido. No obstante, le informaremos si la política cambiara en el futuro. Gracias por utilizar APP y no dude en ponerse en contacto con nosotros.',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: NowColors.c0xFF494C4F,
                            height: 18 / 13,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        InkWell(
                          onTap: () async {
                            final phone = await context
                                .read<WhatsappModel>()
                                .getDictionary();
                            FlutterPlatform.launchWhatsApp(phone);
                          },
                          child: Text(
                            'Suporte via WhatsApp',
                            style: TextStyle(
                              color: NowColors.c0xFF3288F1,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              height: 20 / 14,
                              decoration: TextDecoration.underline,
                              decorationColor: NowColors.c0xFF3288F1,
                            ),
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
        text: 'Volver al inicio',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }
}

/// 授信处理中页面
class StepProcessPage extends StatefulWidget {
  final int? countdown;

  const StepProcessPage({super.key, this.countdown});

  @override
  State<StepProcessPage> createState() => _StepProcessPageState();
}

class _StepProcessPageState extends State<StepProcessPage> {
  late int _countdown;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StepStatusModel>().refreshSubmitResult(5);
    });
    _countdown = widget.countdown ?? 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown <= 0) {
        timer.cancel();
        context.go(AppRouter.main);
      } else {
        setState(() => _countdown--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
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
                EchoTopBar(title: 'Autorizar Resultado'),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(28.w, 64.h, 28.w, 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Image.asset(
                            Drawable.iconStatusOn2,
                            width: 70.r,
                            height: 70.r,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Center(
                          child: Text(
                            _countdown.showCountdown,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: NowColors.c0xFF3288F1,
                              height: 34 / 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'La revisión se está procesando, verifique en 5 minutos, su límite de préstamo se actualizará y podrá continuar con su primer préstamo.',
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
                          'Nota',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: NowColors.c0xFF1C1F23,
                            height: 22 / 14,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Más del 98 % de los clientes reciben los resultados de la verificación en 5 minutos.',
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
        text: 'Volver al inicio',
        onPressed: () => context.go(AppRouter.main),
      ),
    );
  }
}
