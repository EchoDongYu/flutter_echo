import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/main/home_page.dart';
import 'package:flutter_echo/pages/main/mine_page.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    Triple(
      first: 'icon_home_on',
      second: 'icon_home_off',
      third: 'Página Inicial',
    ),
    Triple(first: 'icon_mine_on', second: 'icon_mine_off', third: 'Eu'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: NowColors.c0xFFF3F3F5,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (value) {
                  if (_currentPage != value) {
                    setState(() {
                      _currentPage = value;
                    });
                  }
                },
                children: const [HomePage(), MinePage()],
              ),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建底部导航
  Widget _buildBottomBar() {
    return Container(
      width: double.infinity,
      height: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xD9FFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
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
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 120.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 6.h),
            Image.asset(
              isActive
                  ? R.drawable(bottomItems[index].first)
                  : R.drawable(bottomItems[index].second),
              width: 28.w,
              height: 28.w,
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
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}
