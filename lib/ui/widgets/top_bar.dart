import 'package:flutter/material.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EchoTopBar extends StatelessWidget {
  final bool showBack;
  final bool showSupport;
  final String? title;

  const EchoTopBar({
    super.key,
    this.showBack = true,
    this.showSupport = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 返回按钮
          if (showBack)
            InkWell(
              onTap: () => context.pop(),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  Drawable.iconXtleft,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            )
          else
            const SizedBox(),
          // 标题
          if (title != null)
            Expanded(
              child: Center(
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 26 / 18,
                  ),
                ),
              ),
            )
          else
            const SizedBox(),
          // 客服按钮
          if (showSupport)
            InkWell(
              onTap: () => context.pop(),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  Drawable.iconXtcustomer,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
