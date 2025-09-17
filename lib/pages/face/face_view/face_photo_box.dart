import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacePhotoBox extends StatelessWidget {
  const FacePhotoBox({
    super.key,
    required this.facePhotoUrl,
    required this.faceTipsUrl,
  });

  final String facePhotoUrl;
  final String faceTipsUrl;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 16.w),
      child: Column(
        children: [
          Image.asset(facePhotoUrl, width: context.screenWidth, height: 160.h),
          SizedBox(height: 36.h),
          Image.asset(faceTipsUrl, width: context.screenWidth, height: 86.h),
        ],
      ),
    );
  }
}
