import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 授信表单页面-工作信息
class StepWorkPage extends StatefulWidget {
  const StepWorkPage({super.key});

  @override
  State<StepWorkPage> createState() => _StepWorkPageState();
}

class _StepWorkPageState extends State<StepWorkPage> {
  final List<bool> _isErrors = List.generate(14, (index) {
    return false;
  }, growable: false);
  final TextEditingController _controller = TextEditingController();
  List<List<StepItem>?>? _stepItems;
  final List<StepItem?> _pickedItem = List.generate(11, (index) {
    return null;
  }, growable: false);
  final List<int?> _pickedDay = List.generate(2, (index) {
    return null;
  }, growable: false);

  SubmitModel get submitModel =>
      Provider.of<SubmitModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _onInputChanged());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dict = await submitModel.getDictionary();
      setState(
        () => _stepItems = [
          dict?['3'],
          dict?['12'],
          dict?['5'],
          dict?['6'],
          dict?['6'],
          dict?['6'],
          dict?['1'],
          dict?['4'],
          dict?['7'],
          dict?['2'],
          dict?['8'],
        ],
      );
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

  void _submitData() async {}

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
            onValueChange: (value) => setState(() => _pickedItem[0] = value),
            hintText: 'Estado civil',
            isError: _isErrors[0],
            errorText: 'Por favor seleccione la estado civil',
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[1],
            pickedItem: _pickedItem[1],
            onValueChange: (value) => setState(() => _pickedItem[1] = value),
            hintText: 'Gastos por mes de tu hogar',
            isError: _isErrors[1],
            errorText: 'Por favor seleccione la Gastos por mes de tu hogar',
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[2],
            pickedItem: _pickedItem[2],
            onValueChange: (value) => setState(() => _pickedItem[2] = value),
            hintText: 'Estado de vivienda',
            isError: _isErrors[2],
            errorText: 'Por favor seleccione la estado de vivienda',
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          StepSelectField.pickItem(
            context,
            items: _stepItems?[3],
            pickedItem: _pickedItem[3],
            onValueChange: (value) => setState(() => _pickedItem[3] = value),
            hintText: 'Región',
            isError: _isErrors[3],
            errorText: 'Por favor seleccione la Región',
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[4],
            pickedItem: _pickedItem[4],
            onValueChange: (value) => setState(() => _pickedItem[4] = value),
            hintText: 'Departamento',
            isError: _isErrors[4],
            errorText: 'Por favor seleccione la Departamento',
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[5],
            pickedItem: _pickedItem[5],
            onValueChange: (value) => setState(() => _pickedItem[5] = value),
            hintText: 'Municipio',
            isError: _isErrors[5],
            errorText: 'Por favor seleccione la Municipio',
          ),
          StepInputField(
            controller: _controller,
            hintText: 'Dirección',
            keyboardType: TextInputType.text,
            isError: _isErrors[6],
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
            items: _stepItems?[6],
            pickedItem: _pickedItem[6],
            onValueChange: (value) => setState(() => _pickedItem[6] = value),
            hintText: 'Nivel de estudios',
            isError: _isErrors[7],
            errorText: 'Por favor seleccione la máximo nivel de estudios',
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems?[7],
            pickedItem: _pickedItem[7],
            onValueChange: (value) => setState(() => _pickedItem[7] = value),
            hintText: 'Profesión actual',
            isError: _isErrors[8],
            errorText: 'Por favor seleccione la Profesión actual',
          ),
          if (_pickedItem[7]?.key != _stepItems?[7]?[0].key) ..._buildOthers(),
        ],
      ),
    );
  }

  List<Widget> _buildOthers() {
    return [
      StepSelectField.pickItem(
        context,
        items: _stepItems?[8],
        pickedItem: _pickedItem[8],
        onValueChange: (value) => setState(() => _pickedItem[8] = value),
        hintText: 'Antiguedad en tu trabajo actual',
        isError: _isErrors[9],
        errorText: 'Por favor seleccione la años de trabajo',
      ),
      StepSelectField.pickItem(
        context,
        items: _stepItems?[9],
        pickedItem: _pickedItem[9],
        onValueChange: (value) => setState(() => _pickedItem[9] = value),
        hintText: 'Salario mensual',
        isError: _isErrors[10],
        errorText: 'Por favor seleccione la salario mensual',
      ),
      StepSelectField.pickItem(
        context,
        items: _stepItems?[10],
        pickedItem: _pickedItem[10],
        onValueChange: (value) => setState(() => _pickedItem[10] = value),
        hintText: 'Período de nómina',
        isError: _isErrors[11],
        errorText: 'Por favor seleccione la Período de nómina',
      ),
      if (_pickedItem[10]?.key == _stepItems?[10]?[1].key) ..._buildPickDays(),
      if (_pickedItem[10]?.key == _stepItems?[10]?[2].key)
        StepSelectField.pickDay(
          context,
          pickedDay: _pickedDay[0],
          onValueChange: (value) => setState(() => _pickedDay[0] = value),
          hintText: 'Dia de pago',
          isError: _isErrors[12],
          errorText: 'Por favor seleccione la fecha de pago de salario',
        ),
    ];
  }

  List<Widget> _buildPickDays() {
    return [
      StepSelectField.pickDay(
        context,
        pickedDay: _pickedDay[0],
        onValueChange: (value) => setState(() => _pickedDay[0] = value),
        hintText: 'Dia de pago(primero)',
        isError: _isErrors[12],
        errorText: 'Por favor seleccione la fecha de pago de salario',
      ),
      StepSelectField.pickDay(
        context,
        pickedDay: _pickedDay[1],
        onValueChange: (value) => setState(() => _pickedDay[1] = value),
        hintText: 'Dia de pago(segundo)',
        isError: _isErrors[13],
        errorText: 'Por favor seleccione la fecha de pago de salario',
      ),
    ];
  }
}
