import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 产品+账单首页
class HomeLoanPage extends StatefulWidget {
  const HomeLoanPage({super.key});

  @override
  State<HomeLoanPage> createState() => _HomeLoanPageState();
}

class _HomeLoanPageState extends State<HomeLoanPage> {
  MainModel get mainModel => Provider.of<MainModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 255.h + statusBarHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
            ),
          ),
          child: Image.asset(
            Drawable.bgLoginTop,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          width: double.infinity,
          height: 150.h,
          margin: EdgeInsets.only(top: 106.h + statusBarHeight),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x66F3F3F5), NowColors.c0xFFF3F3F5],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              EchoTopBar(title: AppConst.applicationName, showBack: false),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 90.h),
                  child: Column(
                    children: [
                      // Logo区域
                      Container(
                        width: 80.r,
                        height: 80.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: NowColors.c0xFF3288F1,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Image.asset(Drawable.iconLogo),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Hola!',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: NowColors.c0xFF1C1F23,
                          height: 32 / 22,
                        ),
                      ),
                      Text(
                        '123***456',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: NowColors.c0xFF494C4F,
                          height: 22 / 14,
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
    );
  }
}
