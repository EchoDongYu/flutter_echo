import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepCheckField extends StatelessWidget {
  final Function(int) onCheck;
  final String hintText;
  final List<String> items;
  final int? value;
  final bool isError;

  const StepCheckField({
    super.key,
    required this.onCheck,
    required this.hintText,
    required this.items,
    required this.value,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 60.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: isError ? NowColors.c0xFFFB4F34 : NowColors.c0xFFD8D8D8,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(
            hintText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFF77797B,
              height: 24 / 16,
            ),
          ),
          Expanded(
            child: Container(
              height: 60.h,
              alignment: Alignment.centerRight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.w),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ChoiceChip(
                      label: Text(items[index]),
                      selected: index == value,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
