import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 授信表单页面-联系人信息
class StepContactPage extends StatefulWidget {
  const StepContactPage({super.key});

  @override
  State<StepContactPage> createState() => _StepContactPageState();
}

class _StepContactPageState extends State<StepContactPage> {
  final _isErrors = List.generate(2, (index) {
    return List.generate(3, (index) {
      return false;
    }, growable: false);
  }, growable: false);
  final _controllers = List.generate(2, (index) {
    return List.generate(2, (index) {
      return TextEditingController();
    }, growable: false);
  }, growable: false);
  List<DictItem>? _stepItems;
  final _stepItemsLimit = List<List<DictItem>?>.generate(2, (index) {
    return null;
  }, growable: false);
  final _pickedItem = List<DictItem?>.generate(2, (index) {
    return null;
  }, growable: false);
  final _errorText = List<String?>.generate(2, (index) {
    return null;
  }, growable: false);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        _controllers[i][j].addListener(() => _onInputChanged(i, j));
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final submitModel = context.read<SubmitModel>();
      final dict = await submitModel.getDictionary();
      final data = submitModel.getCachedData();
      setState(() {
        _stepItems = dict?['${SubmitModel.dictContact}'];
        _stepItemsLimit[0] = _stepItems;
        _stepItemsLimit[1] = _stepItems;
        _pickedItem[0] = _stepItems?.findKey(
          data?.baryeOFirstContactRelationship,
        );
        _pickedItem[1] = _stepItems?.findKey(
          data?.kibeOSecondContactRelationship,
        );
      });
      _controllers[0][0].text = data?.grippleOFirstContactName ?? '';
      _controllers[0][1].text = data?.rainOFirstContactMobile ?? '';
      _controllers[1][0].text = data?.aquarianOSecondContactName ?? '';
      _controllers[1][1].text = data?.h3d2wfOSecondContactMobile ?? '';
    });
  }

  @override
  void deactivate() {
    context.read<SubmitModel>().cacheContactInfo(
      inputs: _controllers
          .map((v1) => v1.map((v2) => v2.text).toList())
          .toList(),
      items: _pickedItem.map((it) => it?.key).toList(),
    );
    super.deactivate();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      for (var ctrl in controller) {
        ctrl.dispose();
      }
    }
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged(int i, int j) {
    if (_isErrors[i][j] != false) setState(() => _isErrors[i][j] = false);
  }

  void _pickContact(int pos) async {
    final result = await FlutterPlatform.pickContact();
    if (result != null) {
      final resultPhone = result['phone'] as String?;
      final resultName = result['name'] as String?;
      final phone = resultPhone?.replaceAll(RegExp(r'\s+'), '') ?? '';
      final name = resultName?.replaceAll(emojiReg, '') ?? '';
      final mPhone = phone.startsWith('502') && phone.length > 8
          ? phone.substring(3)
          : phone;
      if (mPhone.length != AppConst.phoneLen) {
        toast(
          'El formato del número de teléfono de contacto es incorrecto. Selecciona un nuevo contacto.',
        );
      } else {
        _controllers[pos][0].text = name;
        _controllers[pos][1].text = mPhone;
      }
    }
  }

  void _submitData() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      for (int i = 0; i < 2; i++) {
        _isErrors[i][0] = _controllers[i][0].text.isEmpty;
        final phone = _controllers[i][1].text;
        _isErrors[i][1] = phone.length != AppConst.phoneLen;
        _isErrors[i][2] = _pickedItem[i] == null;
        _errorText[i] = phone.isNotEmpty
            ? 'El formato del número de teléfono de contacto es incorrecto. Selecciona un nuevo contacto.'
            : null;
      }
    });
    if (!_isErrors.any((it) => it.contains(true))) {
      final list = [_controllers[0][1].text, _controllers[1][1].text];
      final account = LocalStorage().realAccount;
      if (list.toSet().length < list.length) {
        toast('Los dos contactos no pueden ser el mismo número de teléfono');
        return;
      }
      if (list.any((v) => v == account)) {
        toast(
          'El número de teléfono contacto no se puede el mismo numero de registro',
        );
        return;
      }
      context.read<SubmitModel>().submitContactInfo(
        inputs: _controllers
            .map((v1) => v1.map((v2) => v2.text).toList())
            .toList(),
        items: _pickedItem.map((it) => it?.key).toList(),
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
                EchoTopBar(title: 'Contacto de emergencia'),
                SizedBox(height: 16.h),
                WidgetHelper.buildStepProgress(step: 2, maxStep: 3),
                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                        SizedBox(height: 12.h),
                        _buildFormTitle(0),
                        _buildFormArea(0),
                        SizedBox(height: 12.h),
                        _buildFormTitle(1),
                        _buildFormArea(1),
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
        boxShadow: NowStyles.cardShadows,
      ),
      child: Text(
        'Contacto ${pos + 1}',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          height: 24 / 18,
        ),
      ),
    );
  }

  /// 构建表单区域
  Widget _buildFormArea(int pos) {
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
          StepInputField(
            controller: _controllers[pos][0],
            hintText: 'Nombre(s)',
            maxLength: 60,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.deny(emojiReg),
            ],
            suffix: InkWell(
              onTap: () => _pickContact(pos),
              child: Image.asset(
                Drawable.iconContact,
                width: 24.r,
                height: 24.r,
              ),
            ),
            isError: _isErrors[pos][0],
            errorText:
                'El nombre del contacto no puede está vacío. Selecciona un nuevo contacto.',
          ),
          StepInputField(
            controller: _controllers[pos][1],
            hintText: 'Número de teléfono',
            maxLength: AppConst.phoneLen,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            showCounter: true,
            prefix: Container(
              margin: EdgeInsets.only(right: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: NowColors.c0xFFEFF7FF,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: NowColors.c0xFF3288F1, width: 0.5),
              ),
              child: Text(
                '+${AppConst.countryCode}',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF3288F1,
                  height: 14 / 12,
                ),
              ),
            ),
            isError: _isErrors[pos][1],
            errorText:
                _errorText[pos] ??
                'El número del contacto no puede está vacío. Selecciona un nuevo contacto.',
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItemsLimit[pos],
            pickedItem: _pickedItem[pos],
            onValueChange: (value) => setState(() {
              _pickedItem[pos] = value;
              _isErrors[pos][2] = false;
              final zx = [1, 2, 3, 4, 5];
              if (value.key == 2) {
                _stepItemsLimit[1 - pos] = _stepItems
                    ?.where((v) => v.key != 2)
                    .toList();
              } else if (!zx.contains(value.key)) {
                _stepItemsLimit[1 - pos] = _stepItems
                    ?.where((v) => zx.contains(v.key))
                    .toList();
              } else {
                _stepItemsLimit[1 - pos] = _stepItems;
              }
            }),
            hintText: 'Relación',
            isError: _isErrors[pos][2],
            errorText: 'Por favor seleccione la relación',
          ),
        ],
      ),
    );
  }
}
