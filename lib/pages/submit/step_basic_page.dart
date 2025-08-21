import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_check_field.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepBasicPage extends StatefulWidget {
  const StepBasicPage({super.key});

  @override
  State<StepBasicPage> createState() => _StepBasicPageState();
}

class _StepBasicPageState extends State<StepBasicPage> {
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
                EchoTopBar(title: 'Informação Básica'),
                SizedBox(height: 16.h),
                WidgetHelper.buildStepProgress(step: 1),
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
                            'Informacion personal',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 24 / 18,
                            ),
                          ),
                        ),
                        _buildFormArea(),
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
  int? _checkValue;
  String? _selectValue;

  /// 构建表单区域
  Widget _buildFormArea() {
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
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Fecha de Nacimiento',
            value: _selectValue,
            isError: false,
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Nombre(s)',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Apellidos',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          StepInputField(
            controller: _controller,
            hintText: 'CUI',
            maxLength: 13,
            showCounter: true,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Otro número de teléfono(opcional)',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Correo electrónico',
            keyboardType: TextInputType.text,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          StepSelectField(
            onSelect: (value) {
              setState(() {
                _selectValue = 'value';
              });
            },
            hintText: 'Cuenta con algunos otros prestamos vigentes?',
            value: _selectValue,
            isError: false,
          ),
        ],
      ),
    );
  }
}
