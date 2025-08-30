import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const stepItems = [
    'Llenar Datos',
    'Monto Credito',
    'Solicitar Credito',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildTopBar(context),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 90.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCenterBody(context),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Text(
                      'Fácil de usar, rápido e seguro',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                        height: 26 / 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildBottomBody(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 44.r, height: 55.r),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Drawable.iconLogo, width: 32.r, height: 32.r),
              SizedBox(width: 8.w),
              Text(
                'CrediGo',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  height: 26 / 18,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => {},
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              Drawable.iconXtcustomer,
              width: 24.r,
              height: 24.r,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: 6.w),
      ],
    );
  }

  Widget _buildCenterBody(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 34.h),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenido a\nCrediGo',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 44 / 28,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16.h),
              Text(
                'EmprÃéstimos Confi¡veis, Aprovaçäo InstantÃnea.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 28 / 16,
                ),
              ),
              SizedBox(height: 40.h),
              EchoSecondaryButton(
                onPressed: () => context.push(AppRouter.demo),
                text: 'Obtener un préstamo',
                textColor: NowColors.c0xFF3288F1,
                filledColor: Colors.white,
              ),
            ],
          ),
        ),
        Image.asset(Drawable.imageGuard, width: 140.r, height: 140.r),
      ],
    );
  }

  Widget _buildBottomBody() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 16.w, 20.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 140.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                VerticalDivider(width: 2.w, color: NowColors.c0xFFD8D8D8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [_buildStepDot(), _buildStepDot(), _buildStepDot()],
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              spacing: 20.h,
              children: [
                _buildStepItem(0),
                _buildStepItem(1),
                _buildStepItem(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepDot() {
    return SizedBox(
      width: 12.r,
      height: 12.r,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: NowColors.c0xFF3288F1,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
        ),
      ),
    );
  }

  Widget _buildStepItem(int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: const BoxDecoration(
        color: Color(0xFFF4F3F2),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Step ${index + 1}',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF494C4F,
              height: 16 / 12,
            ),
          ),
          SizedBox(width: 13.w),
          Text(
            stepItems[index],
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 24 / 16,
            ),
          ),
        ],
      ),
    );
  }
}
