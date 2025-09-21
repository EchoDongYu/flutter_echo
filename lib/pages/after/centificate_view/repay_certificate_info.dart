import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/providers/bill_detail_provider.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RepayCertificateInfo extends StatelessWidget {
  final int step;

  const RepayCertificateInfo({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<BillDetailModel>(
          builder: (_, provider, _) {
            final photo = provider.certPhoto;
            if (photo == null) {
              return Image.asset(
                Drawable.imageCertExample,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              );
            }
            return GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300.h),
                  child: Image.memory(
                    photo,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          },
        ),
        if (step == 3)
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: NowColors.c0x00000000.withValues(alpha: 0.7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: NowColors.c0xFFFFFFFF,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: NowColors.c0xFF3288F1,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Click para ver',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: NowColors.c0xFF3288F1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'Diagrama de ejemplo de vale',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: NowColors.c0xFFFFFFFF,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
