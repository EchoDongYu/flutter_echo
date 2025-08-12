import 'package:flutter/material.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
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
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 返回按钮
          if (showBack)
            InkWell(
              radius: 8,
              highlightColor: Colors.transparent,
              onTap: () => context.pop(),
              child: Container(
                width: 45.h,
                height: 45.h,
                margin: EdgeInsets.only(left: 6.w),
                padding: EdgeInsets.all(10),
                child: Image.asset(R.drawable('icon_xtleft')),
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
              radius: 8,
              highlightColor: Colors.transparent,
              onTap: () => context.pop(),
              child: Container(
                width: 45.h,
                height: 45.h,
                margin: EdgeInsets.only(right: 6.w),
                padding: EdgeInsets.all(10),
                child: Image.asset(R.drawable('icon_xtcustomer')),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
