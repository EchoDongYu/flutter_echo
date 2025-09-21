import 'package:flutter/cupertino.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayBankStep extends StatelessWidget {
  const RepayBankStep(this.stepText, {required this.stepNumber, super.key});

  final String stepNumber;
  final String stepText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 22.r,
          height: 22.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [NowColors.c0xFF3389F2, NowColors.c0x474CA6FD],
            ),
          ),
          child: Text(
            stepNumber,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              stepText,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF494C4F,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
