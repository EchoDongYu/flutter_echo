import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

/// 强制授权弹窗
class PermissionDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onClosing;

  const PermissionDialog({
    super.key,
    required this.onConfirm,
    required this.onClosing,
  });

  /// 显示强制授权弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => PopScope(
        canPop: false,
        child: PermissionDialog(
          onConfirm: () {
            context.pop(true);
            openAppSettings();
          },
          onClosing: () => context.pop(false),
        ),
      ),
    );
  }

  static const stepItems = [
    'Ve a la "Configuración" de tu teléfono',
    'Haga clic en "CashiGO" para ingresar la información de la solicitud',
    'haga clic en "Permisos" para ingresar a la página de permisos de la aplicación y aceptar todos los permisos.',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.8;
    return BottomSheet(
      onClosing: onClosing,
      enableDrag: false,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(maxHeight: height),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Column(
        children: [
          SizedBox(height: 16.h),
          Text(
            'Solicitar permisos',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 24 / 18,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            color: NowColors.c0xFFEFF7FF,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Text(
              'Necesitamos acceder a sus datos de identificación para validar su identidad y ofrecerle opciones de crédito personalizadas.',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF3288F1,
                height: 18 / 13,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Consejos de funcionamiento',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: NowColors.c0xFF1C1F23,
                      height: 30 / 16,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildStepItem(0),
                  _buildStepItem(1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.w,
                      vertical: 10.h,
                    ),
                    child: Image.asset(
                      Drawable.imageScreenshot1,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  _buildStepItem(2),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.w,
                      vertical: 10.h,
                    ),
                    child: Image.asset(
                      Drawable.imageScreenshot3,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
          WidgetHelper.buildBottomButton(
            text: 'Ir a configuración',
            onPressed: onConfirm,
          ),
        ],
      ),
    );
  }

  /// 构建步骤项目
  Widget _buildStepItem(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 编号圆形图标
          Container(
            width: 22.r,
            height: 22.r,
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
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 20 / 14,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              stepItems[index],
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF1C1F23,
                height: 22 / 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
