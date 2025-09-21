import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonToggleBox extends StatefulWidget {
  final String title;
  final List<String> options;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const CommonToggleBox({
    super.key,
    required this.title,
    required this.options,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<CommonToggleBox> createState() => _CommonToggleBoxState();
}

class _CommonToggleBoxState extends State<CommonToggleBox> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    // 如果没有传初始值，就默认第一个
    _selectedValue = widget.initialValue ?? widget.options.first;
  }

  void _onTap(String value) {
    setState(() {
      _selectedValue = value;
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      borderWidth: 1,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      borderColor: NowColors.c0xFFD8D8D8,
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.sp,
              color: NowColors.c0xFF77797B,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 65.w),
          Expanded(
            child: Row(
              children: List.generate(widget.options.length, (index) {
                final value = widget.options[index];
                final isSelected = value == _selectedValue;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == widget.options.length - 1 ? 0 : 12.w,
                    ),
                    child: GestureDetector(
                      onTap: () => _onTap(value),
                      child: CommonBox(
                        height: 32.h,
                        alignment: Alignment.center,
                        borderWidth: isSelected ? 0 : 1,
                        borderColor: NowColors.c0xFFD8D8D8,
                        color: isSelected ? NowColors.c0xFF3288F1 : Colors.white,
                        padding: EdgeInsets.zero,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: isSelected
                                ? NowColors.c0xFFFFFFFF
                                : NowColors.c0xFF494C4F,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
