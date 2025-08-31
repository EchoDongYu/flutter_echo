import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 授信表单页面-工作信息
class StepWorkPage extends StatefulWidget {
  const StepWorkPage({super.key});

  @override
  State<StepWorkPage> createState() => _StepWorkPageState();
}

class _StepWorkPageState extends State<StepWorkPage> {
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
                EchoTopBar(title: 'Cuenta bancaria'),
                SizedBox(height: 16.h),
                WidgetHelper.buildStepProgress(step: 2),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: NowColors.c0xFFFFF9EA,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    'La información precisa aumenta enormemente tus posibilidades de obtener un préstamo.',
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
                        Container(
                          width: double.infinity,
                          height: 52.h,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                          padding: EdgeInsets.only(left: 16.w),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                NowColors.c0xFF3288F1,
                                NowColors.c0xFF4FAAFF,
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: NowStyles.cardShadows,
                          ),
                          child: Text(
                            'Cuenta bancaria',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 24 / 18,
                            ),
                          ),
                        ),
                        _buildFormArea1(),
                        SizedBox(height: 12.h),
                        _buildFormArea2(),
                        SizedBox(height: 12.h),
                        _buildFormArea3(),
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
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        spacing: 12.h,
        children: [
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Estado civil',
            value: _selectValue,
            isError: false,
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Gastos por mes de tu hogar',
            value: _selectValue,
            isError: false,
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Estado de vivienda',
            value: _selectValue,
            isError: false,
          ),
        ],
      ),
    );
  }

  /// 构建表单区域2
  Widget _buildFormArea2() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        spacing: 12.h,
        children: [
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Región',
            value: _selectValue,
            isError: false,
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Departamento',
            value: _selectValue,
            isError: false,
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Municipio',
            value: _selectValue,
            isError: false,
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Dirección',
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  /// 构建表单区域3
  Widget _buildFormArea3() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        spacing: 12.h,
        children: [
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Nivel de estudios',
            value: _selectValue,
            isError: false,
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Profesión actual',
            value: _selectValue,
            isError: false,
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Antiguedad en tu trabajo actual',
            value: _selectValue,
            isError: false,
          ),
        ],
      ),
    );
  }
}
