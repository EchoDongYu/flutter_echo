import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_check_field.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 授信表单页面-基本信息
class StepBasicPage extends StatefulWidget {
  const StepBasicPage({super.key});

  @override
  State<StepBasicPage> createState() => _StepBasicPageState();
}

class _StepBasicPageState extends State<StepBasicPage> {
  final List<bool> _isErrors = List.generate(8, (index) {
    return false;
  }, growable: false);
  final _controllers = List.generate(5, (index) {
    return TextEditingController();
  }, growable: false);
  List<List<StepItem>?>? _stepItems;
  final List<StepItem?> _pickedItem = List.generate(2, (index) {
    return null;
  }, growable: false);
  DateTime? _pickedDate;

  SubmitModel get submitModel =>
      Provider.of<SubmitModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dict = await submitModel.getDictionary();
      setState(() => _stepItems = [dict?['0'], dict?['6']]);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
                        _buildFormArea(context),
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

  /// 构建表单区域
  Widget _buildFormArea(BuildContext context) {
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
          StepCheckField.pickItem(
            context,
            items: _stepItems?[0],
            pickedItem: _pickedItem[0],
            onValueChange: (value) => setState(() => _pickedItem[0] = value),
            hintText: 'Género',
            isError: _isErrors[0],
          ),
          StepSelectField.pickDate(
            context,
            pickedDate: _pickedDate,
            onValueChange: (value) => setState(() => _pickedDate = value),
            hintText: 'Fecha de Nacimiento',
            isError: _isErrors[1],
          ),
          StepInputField(
            controller: _controllers[0],
            hintText: 'Nombre(s)',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[2],
          ),
          StepInputField(
            controller: _controllers[1],
            hintText: 'Apellidos',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[3],
          ),
          StepInputField(
            controller: _controllers[2],
            hintText: 'CUI',
            maxLength: 13,
            showCounter: true,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[4],
          ),
          StepInputField(
            controller: _controllers[3],
            hintText: 'Otro número de teléfono(opcional)',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[5],
          ),
          StepInputField(
            controller: _controllers[4],
            hintText: 'Correo electrónico',
            keyboardType: TextInputType.text,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[6],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[1],
            pickedItem: _pickedItem[1],
            onValueChange: (value) => setState(() => _pickedItem[1] = value),
            hintText: 'Cuenta con algunos otros prestamos vigentes?',
            isError: _isErrors[7],
          ),
        ],
      ),
    );
  }
}
