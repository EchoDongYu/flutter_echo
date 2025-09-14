import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 授信表单页面-工作信息
class StepWorkPage extends StatefulWidget {
  const StepWorkPage({super.key});

  @override
  State<StepWorkPage> createState() => _StepWorkPageState();
}

class _StepWorkPageState extends State<StepWorkPage> {
  final _isErrors = List.generate(14, (index) {
    return false;
  }, growable: false);
  final _controller = TextEditingController();
  final _pickedItem = List<StepItem?>.generate(11, (index) {
    return null;
  }, growable: false);
  final _pickedArea = List<String?>.generate(3, (index) {
    return null;
  }, growable: false);
  final _pickedDay = List<int?>.generate(2, (index) {
    return null;
  }, growable: false);
  List<List<StepItem>?>? _stepItems;
  Map<String, dynamic>? _stepAreas;
  String? _dayError; // 发薪日

  SubmitModel get submitModel =>
      Provider.of<SubmitModel>(context, listen: false);

  List<String>? get areasFirst => _stepAreas?.keys.toList();

  List<String>? get areasSecond {
    if (_pickedArea[0] == null) return null;
    return _stepAreas?[_pickedArea[0]]?.keys.toList();
  }

  List<String>? get areasThird {
    if (_pickedArea[0] == null || _pickedArea[1] == null) return null;
    return (_stepAreas?[_pickedArea[0]]?[_pickedArea[1]] as List<dynamic>)
        .map((e) => e.toString())
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onInputChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dict = await submitModel.getDictionary();
      String? jsonStr = dict?['${SubmitModel.dictArea}']?.firstOrNull?.value;
      if (jsonStr != null) {
        if (jsonStr.startsWith('"') && jsonStr.endsWith('"')) {
          // 去掉首尾引号
          jsonStr = jsonStr.substring(1, jsonStr.length - 1);
        }
      }
      setState(() {
        _stepItems = SubmitModel.dictWork.map((v) => dict?['$v']).toList();
        if (jsonStr != null) _stepAreas = json.decode(jsonStr);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged() {
    if (_isErrors[6] != false) setState(() => _isErrors[6] = false);
  }

  void _submitData() async {
    final pick4Not0 = _pickedItem[4]?.key != _stepItems?[4]?[0].key;
    final pick72 = _pickedItem[7]?.key == _stepItems?[7]?[1].key;
    final pick71 = pick72 || _pickedItem[7]?.key == _stepItems?[7]?[2].key;
    final sameDay = _pickedDay[0] == _pickedDay[1];
    setState(() {
      _dayError = pick72 && _pickedDay[0] != null && sameDay
          ? 'Dos fechas de pago no pueden ser iguales'
          : null;
      _isErrors[0] = _pickedItem[0] == null;
      _isErrors[1] = _pickedItem[1] == null;
      _isErrors[2] = _pickedItem[2] == null;
      _isErrors[3] = _pickedArea[0] == null;
      _isErrors[4] = _pickedArea[1] == null;
      _isErrors[5] = _pickedArea[2] == null;
      _isErrors[6] = _controller.text.isEmpty;
      _isErrors[7] = _pickedItem[3] == null;
      _isErrors[8] = _pickedItem[4] == null;
      _isErrors[9] = pick4Not0 && _pickedItem[5] == null;
      _isErrors[10] = pick4Not0 && _pickedItem[6] == null;
      _isErrors[11] = pick4Not0 && _pickedItem[7] == null;
      _isErrors[12] = pick4Not0 && pick71 && (_pickedDay[0] == null || sameDay);
      _isErrors[13] = pick4Not0 && pick72 && (_pickedDay[1] == null || sameDay);
    });
    if (!_isErrors.contains(true)) {
      submitModel.submitWorkInfo(
        areas: List.from(_pickedArea)..add(_controller.text),
        items: _pickedItem.map((it) => it?.key).toList(),
        days: _pickedDay,
      );
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
                EchoTopBar(title: 'Información laboral'),
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
                            'Información laboral',
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
        onPressed: _submitData,
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
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        spacing: 16.h,
        children: [
          StepSelectField.pickItem(
            context,
            items: _stepItems?[0],
            pickedItem: _pickedItem[0],
            onValueChange: (value) => setState(() {
              _pickedItem[0] = value;
              _isErrors[0] = false;
            }),
            hintText: 'Estado civil',
            isError: _isErrors[0],
            errorText: _errorHint[0],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[1],
            pickedItem: _pickedItem[1],
            onValueChange: (value) => setState(() {
              _pickedItem[1] = value;
              _isErrors[1] = false;
            }),
            hintText: 'Gastos por mes de tu hogar',
            isError: _isErrors[1],
            errorText: _errorHint[1],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[2],
            pickedItem: _pickedItem[2],
            onValueChange: (value) => setState(() {
              _pickedItem[2] = value;
              _isErrors[2] = false;
            }),
            hintText: 'Estado de vivienda',
            isError: _isErrors[2],
            errorText: _errorHint[2],
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.h,
        children: [
          Text(
            'Tu Dirección Residencia',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 24 / 16,
            ),
          ),
          StepSelectField.pickArea(
            context,
            items: areasFirst,
            pickedItem: _pickedArea[0],
            onValueChange: (value) => setState(() {
              _pickedArea[0] = value;
              _isErrors[3] = false;
            }),
            hintText: 'Región',
            isError: _isErrors[3],
            errorText: _errorHint[3],
          ),
          StepSelectField.pickArea(
            context,
            items: areasSecond,
            pickedItem: _pickedArea[1],
            onValueChange: (value) => setState(() {
              _pickedArea[1] = value;
              _isErrors[4] = false;
            }),
            hintText: 'Departamento',
            isError: _isErrors[4],
            errorText: _errorHint[4],
          ),
          StepSelectField.pickArea(
            context,
            items: areasThird,
            pickedItem: _pickedArea[2],
            onValueChange: (value) => setState(() {
              _pickedArea[2] = value;
              _isErrors[5] = false;
            }),
            hintText: 'Municipio',
            isError: _isErrors[5],
            errorText: _errorHint[5],
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Dirección',
            keyboardType: TextInputType.text,
            isError: _isErrors[6],
            errorText: _errorHint[6],
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
        spacing: 16.h,
        children: [
          StepSelectField.pickItem(
            context,
            items: _stepItems?[3],
            pickedItem: _pickedItem[3],
            onValueChange: (value) => setState(() {
              _pickedItem[3] = value;
              _isErrors[7] = false;
            }),
            hintText: 'Nivel de estudios',
            isError: _isErrors[7],
            errorText: _errorHint[7],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[4],
            pickedItem: _pickedItem[4],
            onValueChange: (value) => setState(() {
              _pickedItem[4] = value;
              _isErrors[8] = false;
              if (value.key == _stepItems?[4]?[0].key) {
                _pickedItem[5] = null;
                _pickedItem[6] = null;
                _pickedItem[7] = null;
                _pickedDay[0] = null;
                _pickedDay[1] = null;
              }
            }),
            hintText: 'Profesión actual',
            isError: _isErrors[8],
            errorText: _errorHint[8],
          ),
          if (_pickedItem[4]?.key != _stepItems?[4]?[0].key) ..._buildOthers(),
        ],
      ),
    );
  }

  List<Widget> _buildOthers() {
    return [
      StepSelectField.pickItem(
        context,
        items: _stepItems?[5],
        pickedItem: _pickedItem[5],
        onValueChange: (value) => setState(() {
          _pickedItem[5] = value;
          _isErrors[9] = false;
        }),
        hintText: 'Antiguedad en tu trabajo actual',
        isError: _isErrors[9],
        errorText: _errorHint[9],
      ),
      StepSelectField.pickItem(
        context,
        items: _stepItems?[6],
        pickedItem: _pickedItem[6],
        onValueChange: (value) => setState(() {
          _pickedItem[6] = value;
          _isErrors[10] = false;
        }),
        hintText: 'Salario mensual',
        isError: _isErrors[10],
        errorText: _errorHint[10],
      ),
      StepSelectField.pickItem(
        context,
        items: _stepItems?[7],
        pickedItem: _pickedItem[7],
        onValueChange: (value) => setState(() {
          _pickedItem[7] = value;
          _isErrors[11] = false;
          if (value.key != _stepItems?[7]?[1].key) {
            _pickedDay[1] = null;
            if (value.key != _stepItems?[7]?[2].key) {
              _pickedDay[0] = null;
            }
          }
        }),
        hintText: 'Período de nómina',
        isError: _isErrors[11],
        errorText: _errorHint[11],
      ),
      if (_pickedItem[7]?.key == _stepItems?[7]?[1].key) ..._buildPickDays(),
      if (_pickedItem[7]?.key == _stepItems?[7]?[2].key)
        StepSelectField.pickDay(
          context,
          pickedDay: _pickedDay[0],
          onValueChange: (value) => setState(() {
            _pickedDay[0] = value;
            _isErrors[12] = false;
          }),
          hintText: 'Dia de pago',
          isError: _isErrors[12],
          errorText: _errorHint[12],
        ),
    ];
  }

  List<Widget> _buildPickDays() {
    return [
      StepSelectField.pickDay(
        context,
        pickedDay: _pickedDay[0],
        onValueChange: (value) => setState(() {
          if (_pickedDay[1] == value) {
            toast(msg: 'Dos fechas de pago no pueden ser iguales');
          } else {
            _pickedDay[0] = value;
            _isErrors[12] = false;
          }
        }),
        hintText: 'Dia de pago(primero)',
        isError: _isErrors[12],
        errorText: _dayError ?? _errorHint[12],
      ),
      StepSelectField.pickDay(
        context,
        pickedDay: _pickedDay[1],
        onValueChange: (value) => setState(() {
          if (_pickedDay[0] == value) {
            toast(msg: 'Dos fechas de pago no pueden ser iguales');
          } else {
            _pickedDay[1] = value;
            _isErrors[13] = false;
          }
        }),
        hintText: 'Dia de pago(segundo)',
        isError: _isErrors[13],
        errorText: _dayError ?? _errorHint[12],
      ),
    ];
  }

  static const _errorHint = [
    'Por favor seleccione la estado civil',
    'Por favor seleccione la Gastos por mes de tu hogar',
    'Por favor seleccione la estado de vivienda',
    'Por favor seleccione la Región',
    'Por favor seleccione la Departamento',
    'Por favor seleccione la Municipio',
    'Por favor introduzca su Dirección',
    'Por favor seleccione la máximo nivel de estudios',
    'Por favor seleccione la Profesión actual',
    'Por favor seleccione la años de trabajo',
    'Por favor seleccione la salario mensual',
    'Por favor seleccione la Período de nómina',
    'Por favor seleccione la fecha de pago de salario',
  ];
}
