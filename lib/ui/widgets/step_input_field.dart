import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final int? maxLength;

  const StepInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.maxLength,
  });

  bool get isExpanded => controller.text.isNotEmpty || focusNode.hasFocus;

  @override
  State<StepInputField> createState() => _StepInputFieldState();
}

class _StepInputFieldState extends State<StepInputField> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onInputChanged);
    widget.focusNode.addListener(_onInputChanged);
  }

  /// 输入变化监听
  void _onInputChanged() {
    final expanded = widget.isExpanded;
    if (_isExpanded != expanded) {
      setState(() {
        _isExpanded = expanded;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        if (!_isExpanded)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              widget.hintText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF77797B,
                height: 24 / 16,
              ),
            ),
          ),
        Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: widget.focusNode.hasFocus
                  ? NowColors.c0xFF3288F1
                  : NowColors.c0xFFD8D8D8,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isExpanded)
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 8.h),
                  child: Text(
                    widget.hintText,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFF77797B,
                      height: 16 / 12,
                    ),
                  ),
                ),
              Expanded(
                child: TextField(
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLength: widget.maxLength,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 22 / 16,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    counterText: '',
                    isCollapsed: _isExpanded,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
