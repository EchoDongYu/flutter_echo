import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayBankCardInfo extends StatelessWidget {
  const RepayBankCardInfo({
    super.key,
    required this.bankCardInfoImageUrl,
    required this.bankCardInfoTitle,
    required this.bankCardInfoText,
    required this.bankCardInfoAccountNumber,
    this.onCopyTap,
  });

  final String bankCardInfoImageUrl;
  final String bankCardInfoTitle;
  final String bankCardInfoText;
  final String bankCardInfoAccountNumber;
  final VoidCallback? onCopyTap;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonBox(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(bankCardInfoImageUrl, width: 72.w, height: 44.h),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bankCardInfoTitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF000000,
                      ),
                    ),
                    Text(
                      bankCardInfoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF3288F1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CommonBox(
            color: NowColors.c0xFF3288F1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tipo de cuenta",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFFFFFFFF.withValues(alpha: 0.8),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Cuenta monetaria",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFFFFFFFF,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Nombre",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFFFFFFFF.withValues(alpha: 0.8),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "YUMI FUTURE, SOCIEDAD ANÓNIMA",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFFFFFFFF,
                  ),
                ),
                SizedBox(height: 16.h),
                CommonBox(
                  color: NowColors.c0x00000000.withValues(alpha: 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Námero de cuenta",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: NowColors.c0xFFFFFFFF.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            bankCardInfoAccountNumber,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: NowColors.c0xFFFFFFFF,
                            ),
                          ),
                        ],
                      ),
                      CommonBox(
                        padding: EdgeInsets.zero,
                        width: 58.w,
                        height: 24.h,
                        borderWidth: 2,
                        color: NowColors.c0x00000000,
                        borderColor: NowColors.c0xFFFFFFFF,
                        onTap: onCopyTap,
                        child: Text(
                          "Copiar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: NowColors.c0xFFFFFFFF,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
