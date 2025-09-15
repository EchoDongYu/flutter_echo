import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBack;
  final bool showSupport;
  final VoidCallback? onPopBack;
  final double radius;

  const CommonAppBar({
    super.key,
    this.title,
    this.showBack = true,
    this.showSupport = true,
    this.onPopBack,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final barHeight = 55.h;

    return Container(
      width: double.infinity,
      height: barHeight + statusBarHeight,
      padding: EdgeInsets.only(top: statusBarHeight, left: 6.w, right: 6.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          // 返回按钮
          if (showBack)
            InkWell(
              onTap: () {
                if (onPopBack != null) {
                  onPopBack?.call();
                } else if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRouter.main);
                }
              },
              borderRadius: BorderRadius.circular(24.r),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(
                  Drawable.iconXtleft,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            )
          else
            SizedBox(width: 45.r, height: 45.r),

          // 标题
          if (title != null)
            Expanded(
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 26 / 18,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            const Spacer(),

          // 客服按钮
          if (showSupport)
            InkWell(
              onTap: () => context.push(AppRouter.aboutUs),
              borderRadius: BorderRadius.circular(24.r),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(
                  Drawable.iconXtcustomer,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            )
          else
            SizedBox(width: 45.r, height: 45.r),
        ],
      ),
    );
  }

  /// 让 AppBar 可以直接放到 Scaffold.appBar 里
  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
