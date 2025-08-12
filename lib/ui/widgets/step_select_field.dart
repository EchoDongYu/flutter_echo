import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepSelectField extends StatefulWidget {
  final Function(String) onSelect;
  final String hintText;
  final String? value;

  const StepSelectField({
    super.key,
    required this.onSelect,
    required this.hintText,
    this.value,
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
      onTap: () {
        
      },
      child: Container(
        width: double.infinity,
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: _isChoosing ? NowColors.c0xFF3288F1 : NowColors.c0xFFD8D8D8,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: widget.value != null ? _buildFieldValue() : _buildFieldHint(),
            ),
            Icon(Icons.arrow_right_rounded, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldValue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    );
  }

  Widget _buildFieldHint() {
    return Text(
      widget.hintText,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: NowColors.c0xFF77797B,
        height: 24 / 16,
      ),
    );
  }
}
