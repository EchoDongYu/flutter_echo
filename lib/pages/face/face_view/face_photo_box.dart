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
      child: Column(
        children: [
          Image.asset(facePhotoUrl, width: context.screenWidth, height: 160.h),
          SizedBox(width: 36.h),
          Image.asset(faceTipsUrl, width: context.screenWidth, height: 86.h),
        ],
      ),
    );
  }
}
