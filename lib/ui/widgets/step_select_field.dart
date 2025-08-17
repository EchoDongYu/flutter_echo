import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepSelectField extends StatefulWidget {
  final Function(String) onSelect;
  final String hintText;
  final String? value;
  final bool isError;

  const StepSelectField({
    super.key,
    required this.onSelect,
    required this.hintText,
    required this.value,
    required this.isError,
  });

  @override
  State<StepSelectField> createState() => _StepSelectFieldState();
}

class _StepSelectFieldState extends State<StepSelectField> {
  bool _isChoosing = false;

  void _onFocusChanged(bool value) {
    if (_isChoosing != value) {
      setState(() {
        _isChoosing = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        _onFocusChanged(true);
        //await DialogHelper.showPickItemDialog(context: context);
        _onFocusChanged(false);
      },
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 60.h),
        padding: EdgeInsets.only(left: 12.w, right: 4.w),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: widget.isError
                ? NowColors.c0xFFFB4F34
                : _isChoosing
                ? NowColors.c0xFF3288F1
                : NowColors.c0xFFD8D8D8,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: widget.value != null
                  ? _buildFieldValue()
                  : Text(
                      widget.hintText,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                        height: 24 / 16,
                      ),
                    ),
            ),
            Icon(
              Icons.arrow_right_rounded,
              color: NowColors.c0xFFB0B1B2,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldValue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 9.h),
        Text(
          widget.hintText,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: NowColors.c0xFF77797B,
            height: 16 / 12,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          widget.value!,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: NowColors.c0xFF1C1F23,
            height: 22 / 16,
          ),
        ),
        SizedBox(height: 9.h),
      ],
    );
  }
}
