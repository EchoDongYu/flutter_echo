import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/home_step.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 未授信首页
class HomeDefaultPage extends StatefulWidget {
  const HomeDefaultPage({super.key});

  @override
  State<HomeDefaultPage> createState() => _HomeDefaultPageState();
}

class _HomeDefaultPageState extends State<HomeDefaultPage> {
  MainModel get mainModel => Provider.of<MainModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildTopBar(context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 90.h),
              children: [
                _buildCenterBody(context),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    'En solo 3 pasos',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: NowColors.c0xFF1C1F23,
                      height: 26 / 18,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                HomeBottomStep(),
              ],
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
                AppConst.applicationName,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Bienvenido a\n${AppConst.applicationName}',
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
                'Prestamista autorizado, seguro y profesional',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 28 / 16,
                ),
              ),
              SizedBox(height: 40.h),
              EchoSecondaryButton(
                onPressed: () => mainModel.launchDefault(),
                text: 'Obtén crédito',
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
}
