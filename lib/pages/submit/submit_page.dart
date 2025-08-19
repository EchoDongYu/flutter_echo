import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/ui/widgets/step_check_field.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 认证页面
class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  final TextEditingController _controller = TextEditingController();
  int? _checkValue;
  String? _selectValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('用户认证')),
      body: Column(
        children: [
          SizedBox(height: 12.h),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Cuenta con algunos otros prestamos vigentes? ',
            value: _selectValue,
            isError: false,
          ),
          SizedBox(height: 12.h),
          StepCheckField(
            onCheck: (value) {
              setState(() {
                _checkValue = value;
              });
            },
            hintText: 'Género',
            items: ['Masculino', 'Femenino'].reversed.toList(),
            value: _checkValue,
            isError: false,
          ),
          SizedBox(height: 12.h),
          StepInputField(
            controller: _controller,
            hintText: 'Código de verificación',
            maxLength: AppConstants.codeLength,
            showCounter: true,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 104.w,
                height: 44.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: NowColors.c0xFFC7C7C7, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
