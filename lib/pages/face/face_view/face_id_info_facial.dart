import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/providers/id_card_provider.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FaceIdInfoFacial extends StatelessWidget {
  const FaceIdInfoFacial({
    super.key,
    required this.dpiFaceTitle,
    this.dpiFaceTap,
  });

  final String dpiFaceTitle;
  final VoidCallback? dpiFaceTap;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          CommonBox(
            color: NowColors.c0xFF3288F1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Text(
              "Foto facial",
              style: TextStyle(
                fontSize: 18.sp,
                color: NowColors.c0xFFFFFFFF,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CommonBox(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Consumer<IdCardModel>(
              builder: (_, provider, _) {
                String? faceUrl1 = provider.faceUrl1;
                UploadImageStatus uploadStatus = provider.mFaceUploadStatus;

                return Column(
                  children: [
                    CommonBox(
                      onTap: dpiFaceTap,
                      borderWidth: 1,
                      borderColor: NowColors.c0xFFD8D8D8,
                      child: Column(
                        children: [
                          // 直接使用provider的数据
                          if (uploadStatus == UploadImageStatus.success &&
                              faceUrl1 != null)
                            Image.network(
                              faceUrl1,
                              width: context.screenWidth,
                              height: 160.h,
                            )
                          else if (uploadStatus == UploadImageStatus.failed)
                            SizedBox(
                              height: 160.h, // 设置父容器高度为 160.h
                              child: Center(
                                child: Image.asset(
                                  Drawable.iconImgbrokea1,
                                  width: 64.h, // 设置图片宽度为 64.h
                                  height: 64.h, // 设置图片高度为 64.h
                                ),
                              ),
                            )
                          else
                            Image.asset(
                              Drawable.iconRosto,
                              width: context.screenWidth,
                              height: 160.h,
                            ),
                          SizedBox(height: 12.h),
                          Text(
                            provider.faceTitle(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: NowColors.c0xFF3288F1,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: NowColors.c0xFF3288F1,
                              decorationThickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
