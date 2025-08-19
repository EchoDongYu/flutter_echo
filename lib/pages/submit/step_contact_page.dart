import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepContactPage extends StatefulWidget {
  const StepContactPage({super.key});

  @override
  State<StepContactPage> createState() => _StepContactPageState();
}

class _StepContactPageState extends State<StepContactPage> {
  static const platform = MethodChannel('com.murphy.flutter_echo/channel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                EchoTopBar(title: 'Informação Básica'),
                SizedBox(height: 16.h),
                WidgetHelper.buildStepProgress(step: 3),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: NowColors.c0xFFFFF9EA,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    'Estimado usuario, CreditYa mantendra sus datos seguros y no los compartira con tercero',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFFFF9817,
                      height: 16 / 13,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        _buildFormTitle(1),
                        _buildFormArea1(),
                        SizedBox(height: 12.h),
                        _buildFormTitle(2),
                        _buildFormArea1(),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Continuar',
        onPressed: () {},
      ),
    );
  }

  final TextEditingController _controller = TextEditingController();
  String? _selectValue;

  Widget _buildFormTitle(int pos) {
    return Container(
      width: double.infinity,
      height: 52.h,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.only(left: 16.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Text(
        'Contacto $pos',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          height: 24 / 18,
        ),
      ),
    );
  }

  /// 构建表单区域1
  Widget _buildFormArea1() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          StepInputField(
            controller: _controller,
            hintText: 'Nombre(s)',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: InkWell(
              onTap: () async {
                final result = await platform.invokeMethod<Map>('pickContact');
                if (result != null) {
                  _controller.text = "${result['name']} - ${result['phone']}";
                }
              },
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Image.asset(
                  R.drawable('icon_contact'),
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            ),
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Número de teléfono',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Relación',
            value: _selectValue,
            isError: false,
          ),
        ],
      ),
    );
  }
}
