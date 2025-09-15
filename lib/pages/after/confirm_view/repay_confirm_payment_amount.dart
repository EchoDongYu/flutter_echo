import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayConfirmPaymentAmount extends StatelessWidget {
  const RepayConfirmPaymentAmount({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Importe de pago",
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          QInput(onChanged: onChanged),
          SizedBox(height: 8.h),
          Divider(color: NowColors.c0xFFC7C7C7, height: 1),
        ],
      ),
    );
  }
}

class QInput extends StatefulWidget {
  final String prefix;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const QInput({
    super.key,
    this.prefix = "Q",
    this.hintText = "123",
    this.onChanged,
  });

  @override
  State<QInput> createState() => _QInputState();
}

class _QInputState extends State<QInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 左侧固定前缀
        Text(
          widget.prefix,
          style: TextStyle(
            color: NowColors.c0xFF3288F1,
            fontWeight: FontWeight.w500,
            fontSize: 32.sp,
          ),
        ),
        SizedBox(width: 6.w),
        // 中间输入框
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              // hintStyle: TextStyle(
              //   fontSize: 32.sp,
              //   color: NowColors.c0xFFB0B1B2,
              //   fontWeight: FontWeight.w500,
              // ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 32.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
            onChanged: (value) {
              setState(() {}); // 更新清除按钮显示状态
              widget.onChanged?.call(value);
            },
          ),
        ),
        // 右侧清除按钮
        // if (_controller.text.isNotEmpty)
        GestureDetector(
          onTap: () {
            _controller.clear();
            setState(() {});
            widget.onChanged?.call("");
          },
          child: Image.asset(Drawable.iconClear, width: 20, height: 20),
        ),
      ],
    );
  }
}
