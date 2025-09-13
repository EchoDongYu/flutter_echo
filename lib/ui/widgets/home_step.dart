import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomStep extends StatelessWidget {
  const HomeBottomStep({super.key});

  @override
  Widget build(BuildContext context) {
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
            _stepItems[index],
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

  static const _stepItems = ['Registrarse', 'Obtén crédito', 'Obtén efectivo'];
}
