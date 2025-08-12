import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/step_check_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 认证页面
class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('用户认证')),
      body: Column(
        children: [
          SizedBox(height: 12.h),
          StepSelectField(
            onSelect: (value) {},
            hintText: 'Cuenta con algunos otros prestamos vigentes? ',
            value: 'value',
            isError: false,
          ),
          SizedBox(height: 12.h),
          StepCheckField(
            onCheck: (value) {},
            hintText: 'Género',
            items: ['Masculino', 'Femenino'],
            value: 0,
            isError: false,
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
