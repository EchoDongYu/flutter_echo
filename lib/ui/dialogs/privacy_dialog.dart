import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 隐私政策弹窗
class PrivacyDialog extends StatelessWidget {
  final VoidCallback onAgree;
  final VoidCallback onDisagree;

  const PrivacyDialog({
    super.key,
    required this.onAgree,
    required this.onDisagree,
  });

  /// 显示隐私政策弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => PopScope(
        canPop: false,
        child: PrivacyDialog(
          onAgree: () => context.pop(true),
          onDisagree: () => context.pop(false),
        ),
      ),
    );
  }

  static const permissionItems = [
    Pair(
      'SMS',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las infommaciones del prestamo que pago.Estimado estos son los nombres de refer encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las infommaciones del prestamo que pago.',
    ),
    Pair(
      'Solo contacto de emergencia',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las ',
    ),
    Pair(
      'Ubicaciones',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
    Pair(
      'Camara',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
    Pair(
      'Datos del dispositivo',
      'Estimado estos son los nombres de refer encias encias disponibles para poder dlaEstimado estos son los nombres de refer encias encias disponibles para poder dlaEstimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.8;
    return BottomSheet(
      onClosing: onDisagree,
      enableDrag: false,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(maxHeight: height),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(height: 16.h),
              Text(
                'Politicas de privacidad',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 24 / 18,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(14.w, 22.h, 14.w, 90.h),
                  itemCount: permissionItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 22.h),
                  itemBuilder: (context, index) {
                    return _buildPermissionItem(permissionItems[index]);
                  },
                ),
              ),
            ],
          ),
          WidgetHelper.buildBottomBlurButton(
            confirmText: 'Aceptar',
            cancelText: 'Discrepar',
            onConfirm: onAgree,
            onCancel: onDisagree,
          ),
        ],
      ),
    );
  }

  /// 构建权限项目
  Widget _buildPermissionItem(Pair item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 2.h),
              child: Text(
                item.first,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 30 / 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            item.second,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFF494C4F,
              height: 20 / 13,
            ),
          ),
        ),
      ],
    );
  }
}
