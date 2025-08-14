import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 授权声明弹窗
class PermissionDialog extends StatelessWidget {
  final VoidCallback onAgree;
  final VoidCallback onDisagree;

  const PermissionDialog({
    super.key,
    required this.onAgree,
    required this.onDisagree,
  });

  static const permissionItems = [
    Pair(
      first: 'SMS',
      second:
          'Estimado estos son los nombres de refer encias encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las infommaciones del prestamo que pago.Estimado estos son los nombres de refer encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las infommaciones del prestamo que pago.',
    ),
    Pair(
      first: 'Solo contacto de emergencia',
      second:
          'Estimado estos son los nombres de refer encias encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las ',
    ),
    Pair(
      first: 'Ubicaciones',
      second:
          'Estimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
    Pair(
      first: 'Camara',
      second:
          'Estimado estos son los nombres de refer encias encias disponibles para poder dla',
    ),
    Pair(
      first: 'Datos del dispositivo',
      second:
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
                'Permiso',
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
                  'Estimado estos son los nombres de refer encias disponibles para poder dlarle un ej emplo y facilitar cuando completas las infommaciones del prestamo que pago.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF3288F1,
                    height: 18 / 13,
                  ),
                ),
              ),
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
          _buildBottomButtons(),
        ],
      ),
    );
  }

  /// 构建权限项目
  Widget _buildPermissionItem(Pair item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 22.w,
              height: 22.w,
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

  /// 构建底部按钮
  Widget _buildBottomButtons() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xD9FFFFFF),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: NowStyles.bottomShadows,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          // 不同意按钮
          Expanded(
            child: EchoOutlinedButton(text: 'Discrepar', onPressed: onDisagree),
          ),
          SizedBox(width: 12.w),
          // 同意按钮
          Expanded(
            child: EchoPrimaryButton(text: 'Siguiente', onPressed: onAgree),
          ),
        ],
      ),
    );
  }
}
