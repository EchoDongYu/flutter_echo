import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widgets/common_box.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayConfirmInput extends StatelessWidget {
  const RepayConfirmInput({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CommonBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monto a pagar',
            style: TextStyle(
              fontSize: 18.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          QInput(onChanged: onChanged),
          Divider(color: NowColors.c0xFFC7C7C7, height: 1),
        ],
      ),
    );
  }
}

class QInput extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const QInput({super.key, this.hintText = '123', this.onChanged});

  @override
  State<QInput> createState() => _QInputState();
}

class _QInputState extends State<QInput> {
  final TextEditingController _controller = TextEditingController();
  int _inputLength = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onInputChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged() {
    final value = _controller.text.length;
    if (_inputLength != value) setState(() => _inputLength = value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 左侧固定前缀
        Text(
          'Q',
          style: TextStyle(
            color: NowColors.c0xFF3288F1,
            fontWeight: FontWeight.w700,
            fontSize: 32.sp,
          ),
        ),
        SizedBox(width: 12.w),
        // 中间输入框
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 30.sp,
                color: NowColors.c0xFF494C4F,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 32.sp,
              color: NowColors.c0xFF1C1F23,
              fontWeight: FontWeight.w600,
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            cursorColor: NowColors.c0xFF3288F1,
            onChanged: (value) => widget.onChanged?.call(value),
          ),
        ),
        // 右侧清除按钮
        if (_inputLength > 0)
          GestureDetector(
            onTap: () {
              _controller.clear();
              widget.onChanged?.call('');
            },
            child: Image.asset(Drawable.iconClear, width: 20, height: 20),
          ),
      ],
    );
  }
}
