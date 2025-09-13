import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/submit/confirm_step_dialog.dart';
import 'package:flutter_echo/pages/submit/dpi_number_dialog.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_check_field.dart';
import 'package:flutter_echo/ui/widgets/step_email_field.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 授信表单页面-基本信息
class StepBasicPage extends StatefulWidget {
  const StepBasicPage({super.key});

  @override
  State<StepBasicPage> createState() => _StepBasicPageState();
}

class _StepBasicPageState extends State<StepBasicPage> {
  final _isErrors = List.generate(8, (index) {
    return false;
  }, growable: false);
  final _controllers = List.generate(5, (index) {
    return TextEditingController();
  }, growable: false);
  final _pickedItem = List<StepItem?>.generate(2, (index) {
    return null;
  }, growable: false);
  DateTime? _pickedDate;
  String? _cuiError;
  String? _emailError;
  String? _phoneError; // 备用手机号
  List<List<StepItem>?>? _stepItems;

  SubmitModel get submitModel =>
      Provider.of<SubmitModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _controllers[0].addListener(() => _onInputChanged(2));
    _controllers[1].addListener(() => _onInputChanged(3));
    _controllers[2].addListener(() => _onInputChanged(4));
    _controllers[4].addListener(() => _onInputChanged(6));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dict = await submitModel.getDictionary();
      setState(() {
        _stepItems = SubmitModel.dictBasic.map((v) => dict?['$v']).toList();
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged(int pos) {
    if (_isErrors[pos] != false) setState(() => _isErrors[pos] = false);
  }

  void _submitData(BuildContext context) async {
    final text2 = _controllers[2].text;
    final text3 = _controllers[3].text;
    final text4 = _controllers[4].text;
    final emailValid = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(text4);
    setState(() {
      _isErrors[0] = _pickedItem[0] == null;
      _isErrors[1] = _pickedDate == null;
      _isErrors[2] = _controllers[0].text.isEmpty;
      _isErrors[3] = _controllers[1].text.isEmpty;
      _isErrors[4] = text2.length != 13;
      _isErrors[5] = text3.length != 8 || text3 == LocalStorage().account;
      _isErrors[6] = text4.isEmpty || !emailValid;
      _isErrors[7] = _pickedItem[1] == null;
      if (text2.isEmpty) {
        _cuiError = null;
      } else if (text2.length != 13) {
        _cuiError = _errorTip[0];
      }
      if (text3.isEmpty) {
        _phoneError = null;
      } else if (text3.isNotEmpty && text3.length != 8) {
        _phoneError = _errorTip[3];
      } else if (text3.isNotEmpty && text3 == LocalStorage().account) {
        _phoneError = _errorTip[2];
      }
      if (text4.isEmpty) {
        _emailError = null;
      } else if (!emailValid) {
        _emailError = _errorTip[1];
      }
    });
    if (!_isErrors.contains(true)) {
      final list = [
        Pair('Género', _pickedItem[0]?.value),
        Pair('Fecha de Nacimiento', _pickedDate?.showDate),
        Pair('Nombre(s)', _controllers[0].text),
        Pair('Apellidos', _controllers[1].text),
        Pair('CUI', _controllers[2].text),
        Pair('Otro número de teléfono(opcional)', _controllers[3].text),
        Pair('Correo electrónico', _controllers[4].text),
        Pair(
          'Cuenta con algunos otros prestamos vigentes?',
          _pickedItem[1]?.value,
        ),
      ];
      list.removeWhere((v) => v.second?.isNotEmpty != true);
      final result = await ConfirmStepDialog.show(context, list);
      if (result == true) {
        submitModel.submitBasicInfo(
          inputs: _controllers.map((it) => it.text).toList(),
          items: _pickedItem.map((it) => it?.key).toList(),
          birthday: _pickedDate?.millisecond,
        );
      }
    }
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
                EchoTopBar(title: 'Información básica'),
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
                    'Estimado usuario, CashiGO mantendra sus datos seguros y no los compartira con tercero',
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
        onPressed: () => _submitData(context),
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
        spacing: 16.h,
        children: [
          StepCheckField.pickItem(
            context,
            items: _stepItems?[0],
            pickedItem: _pickedItem[0],
            onValueChange: (value) => setState(() {
              _pickedItem[0] = value;
              _isErrors[0] = false;
            }),
            hintText: 'Género',
            isError: _isErrors[0],
            errorText: _errorHint[0],
          ),
          StepSelectField.pickDate(
            context,
            pickedDate: _pickedDate,
            onValueChange: (value) => setState(() {
              _pickedDate = value;
              _isErrors[1] = false;
            }),
            hintText: 'Fecha de Nacimiento',
            isError: _isErrors[1],
            errorText: _errorHint[1],
          ),
          StepInputField(
            controller: _controllers[0],
            hintText: 'Nombre(s)',
            maxLength: 30,
            keyboardType: TextInputType.text,
            isError: _isErrors[2],
            errorText: _errorHint[2],
          ),
          StepInputField(
            controller: _controllers[1],
            hintText: 'Apellidos',
            maxLength: 30,
            keyboardType: TextInputType.text,
            isError: _isErrors[3],
            errorText: _errorHint[3],
          ),
          StepInputField(
            controller: _controllers[2],
            hintText: 'CUI',
            maxLength: 13,
            showCounter: true,
            suffix: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: InkWell(
                onTap: () => DpiNumberDialog.show(context),
                child: Image.asset(
                  Drawable.iconQuestion,
                  width: 20.r,
                  height: 20.r,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[4],
            errorText: _cuiError ?? _errorHint[4],
          ),
          StepInputField(
            controller: _controllers[3],
            hintText: 'Otro número de teléfono(opcional)',
            maxLength: AppConst.phoneLen,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[5],
            errorText: _phoneError ?? _errorHint[5],
          ),
          StepEmailField(
            controller: _controllers[4],
            hintText: 'Correo electrónico',
            isError: _isErrors[6],
            errorText: _emailError ?? _errorHint[6],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[1],
            pickedItem: _pickedItem[1],
            onValueChange: (value) => setState(() {
              _pickedItem[1] = value;
              _isErrors[7] = false;
            }),
            hintText: 'Cuenta con algunos otros prestamos vigentes?',
            isError: _isErrors[7],
            errorText: _errorHint[7],
          ),
        ],
      ),
    );
  }

  static const _errorHint = [
    'Por favor seleccione la Género',
    'Por favor seleccione un fecha de nacimiento',
    'Por favor introduzca un nombre',
    'Por favor introduzca un Apellidos',
    'Por favor introduzca su CUI',
    'Por favor introduzca',
    'Por favor introduzca su correo electrónico',
    'Por favor seleccione',
  ];

  static const _errorTip = [
    'Formato CUI incorrecto',
    'Formatode correo electrónico incorrecto',
    'El número de teléfono móvil alternativo no puede ser el mismo que el número de teléfono móvil registrado.',
    'El formato del número de teléfono móvil alternativo es incorrecto',
  ];
}
