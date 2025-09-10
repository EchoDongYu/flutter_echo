import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/pages/main/home_page.dart';
import 'package:flutter_echo/pages/main/profile_page.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 主页面
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const bottomItems = [
    Triple(Drawable.iconHomeOn, Drawable.iconHomeOff, 'Inicio'),
    Triple(Drawable.iconMineOn, Drawable.iconMineOff, 'Mi'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: _currentPage == 0
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: NowColors.c0xFFF3F3F5,
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (value) {
                if (_currentPage != value) {
                  if (!LocalStorage().isLogin) {
                    context.go(AppRouter.loginPhone);
                  } else {
                    setState(() => _currentPage = value);
                  }
                }
              },
              children: const [HomePage(), ProfilePage()],
            ),
            Align(alignment: Alignment.bottomCenter, child: _buildBottomBar()),
          ],
        ),
      ),
    );
  }

  /// 构建底部导航
  Widget _buildBottomBar() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xD9FFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: NowStyles.bottomShadows,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildBottomItem(0), _buildBottomItem(1)],
      ),
    );
  }

  Widget _buildBottomItem(int index) {
    final isActive = _currentPage == index;
    return InkWell(
      onTap: () => _controller.jumpToPage(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        constraints: BoxConstraints(minWidth: 120.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 2.h,
          children: [
            Image.asset(
              isActive ? bottomItems[index].first : bottomItems[index].second,
              width: 28.r,
              height: 28.r,
            ),
            Text(
              bottomItems[index].third,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: isActive ? NowColors.c0xFF3288F1 : NowColors.c0xFF77797B,
                height: 14 / 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
