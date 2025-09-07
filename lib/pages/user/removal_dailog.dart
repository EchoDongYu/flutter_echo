import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 删除账号风险提示弹窗
class RemovalDailog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const RemovalDailog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  static const stepItems = [
    'Los usuarios con facturas impagas (incluidas facturas vencidas) y pedidos en proceso no pueden eliminar sus cuentas.',
    'Se eliminará toda la información personal (avatar, apodo, ID de usuario)',
    'Se considerará que usted ha renunciado a todos los cupones (si los hay) en la plataforma y no se podrán utilizar más.',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Drawable.iconStatusWarn, width: 64.r, height: 64.r),
            SizedBox(height: 24.h),
            Text(
              'Advertencia de riesgo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF1C1F23,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                height: 30 / 20,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Una vez eliminada la cuenta, ya no podrá utilizarla ni recuperar ninguna información relacionada con ella. Lea y comprenda completamente los siguientes asuntos:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: NowColors.c0xFF494C4F,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 22 / 14,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.h),
              decoration: const BoxDecoration(
                color: NowColors.c0xFFF3F3F5,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                spacing: 16.h,
                children: [
                  _buildStepItem(0),
                  _buildStepItem(1),
                  _buildStepItem(2),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: EchoOutlinedButton(
                    text: 'Continuar',
                    onPressed: onConfirm,
                    textColor: NowColors.c0xFF3288F1,
                    borderColor: NowColors.c0xFF3288F1,
                    filledColor: NowColors.c0xFFEFF7FF,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: EchoPrimaryButton(
                    text: 'Cancelar',
                    onPressed: onCancel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 构建步骤项目
  Widget _buildStepItem(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 编号圆形图标
        Container(
          width: 20.r,
          height: 20.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [NowColors.c0xFF3389F2, NowColors.c0x474CA6FD],
            ),
          ),
          child: Center(
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: NowColors.c0xFF1C1F23,
                height: 16 / 12,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            stepItems[index],
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFF494C4F,
              height: 16 / 12,
            ),
          ),
        ),
      ],
    );
  }
}
