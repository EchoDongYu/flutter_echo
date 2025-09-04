import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final int? maxLength;
  final bool isError;
  final bool showCounter;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const StepInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText = 'Por favor introduzca',
    this.maxLength,
    this.isError = false,
    this.showCounter = false,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
  });

  @override
  State<StepInputField> createState() => _StepInputFieldState();
}

class _StepInputFieldState extends State<StepInputField> {
  final FocusNode _focusNode = FocusNode();
  bool _isExpanded = false;
  int _inputLength = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(widget.showCounter ? _onInputChanged : _onFocusChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged() {
    final value = widget.controller.text.length;
    if (_inputLength != value) {
      setState(() {
        _inputLength = value;
      });
    }
    _onFocusChanged();
  }

  /// 焦点变化监听
  void _onFocusChanged() {
    final expanded = widget.controller.text.isNotEmpty || _focusNode.hasFocus;
    if (_isExpanded != expanded) {
      setState(() {
        _isExpanded = expanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            if (!_isExpanded)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  widget.hintText,
                  style: TextStyle(
                    fontSize: widget.hintText.length > 30 ? 14.sp : 16.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF77797B,
                    height: 24 / 16,
                  ),
                ),
              ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 62.h),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: _focusNode.hasFocus
                      ? NowColors.c0xFF3288F1
                      : widget.isError
                      ? NowColors.c0xFFFB4F34
                      : NowColors.c0xFFD8D8D8,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // labelText
                        if (_isExpanded)
                          Padding(
                            padding: EdgeInsets.only(left: 12.w, top: 8.h, bottom: 4.h),
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
                        TextField(
                          autofocus: false,
                          focusNode: _focusNode,
                          controller: widget.controller,
                          keyboardType: widget.keyboardType,
                          textInputAction: widget.textInputAction,
                          inputFormatters: widget.inputFormatters,
                          maxLength: widget.maxLength,
                          obscureText: widget.obscureText,
                          obscuringCharacter: '*',
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
                            contentPadding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 8.h),
                            prefix: widget.prefix,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // suffixCounter
                  if (widget.showCounter && _isExpanded)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$_inputLength/${widget.maxLength}',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: NowColors.c0xFFB0B1B2,
                            height: 20 / 13,
                          ),
                        ),
                        SizedBox(width: 9.w),
                        InkWell(
                          onTap: () => widget.controller.clear(),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            width: 18.r,
                            height: 18.r,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: NowColors.c0xFFB0B1B2,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close_rounded, color: Colors.white, size: 13),
                          ),
                        ),
                        SizedBox(width: 13.w),
                      ],
                    ),
                  // suffixCustom
                  ?widget.suffix,
                ],
              ),
            ),
          ],
        ),
        if (widget.isError)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Text(
              widget.errorText,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFFFB4F34,
                height: 16 / 12,
              ),
            ),
          ),
      ],
    );
  }
}
