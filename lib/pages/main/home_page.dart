import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const stepItems = [
    'Enviar Informações',
    'Obtenha Crédito',
    'Levantar Dinheiro',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopBar(context),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 82.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCenterBody(),
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
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 45.h, height: 45.h),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 32.w,
                height: 32.w,
                child: Image.asset(R.drawable('icon_logo1')),
              ),
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
          radius: 8,
          highlightColor: Colors.transparent,
          onTap: () => context.push(AppRouter.demo),
          child: Container(
            width: 45.h,
            height: 45.h,
            margin: EdgeInsets.only(right: 6.w),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              R.drawable('icon_xtcustomer'),
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCenterBody() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 34.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
            ),
            borderRadius: BorderRadius.circular(20.r),
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
                onPressed: () {},
                text: 'Obtener un préstamo',
                textColor: NowColors.c0xFF3288F1,
                filledColor: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 140.w,
          height: 140.w,
          child: Image.asset(R.drawable('img_guard')),
        ),
      ],
    );
  }

  Widget _buildBottomBody() {
    return Container(
      width: double.infinity,
      height: 212.h,
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 16.w, 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                VerticalDivider(width: 2.w, color: NowColors.c0xFFD8D8D8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildStepDot(), _buildStepDot(), _buildStepDot()],
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      width: 12.w,
      height: 12.w,
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
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F2),
        borderRadius: BorderRadius.circular(22.r),
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
