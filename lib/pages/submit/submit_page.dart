import 'package:flutter/material.dart';
import 'package:flutter_echo/ui/widgets/step_check_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';

/// 认证页面
class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('用户认证')),
      body: Column(
        children: [
          StepSelectField(
            onSelect: (value) {},
            value: 'value',
            hintText: 'hintText',
          ),
          StepCheckField(),
        ],
      ),
    );
  }
}
