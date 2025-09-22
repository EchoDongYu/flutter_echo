import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EchoTopBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;
  final bool showSupport;
  final String? title;
  final VoidCallback? onPopBack;

  const EchoTopBar({
    super.key,
    this.showBack = true,
    this.showSupport = true,
    this.title,
    this.onPopBack,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: onPopBack == null,
      onPopInvokedWithResult: (_, _) => onPopBack?.call(),
      child: Container(
        width: double.infinity,
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
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
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
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
              Expanded(child: SizedBox()),
            // 客服按钮
            if (showSupport)
              InkWell(
                onTap: () => context.push(AppRouter.aboutUs),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(10),
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
      ),
    );
  }

  /// 让 AppBar 可以直接放到 Scaffold.appBar 里
  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
