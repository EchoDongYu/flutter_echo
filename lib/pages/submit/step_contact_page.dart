import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/submit_provider.dart';
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
  final List<List<bool>> _isErrors = List.generate(2, (index) {
    return List.generate(3, (index) {
      return false;
    }, growable: false);
  }, growable: false);
  final _controllers = List.generate(2, (index) {
    return List.generate(2, (index) {
      return TextEditingController();
    }, growable: false);
  }, growable: false);
  List<StepItem>? _stepItems;
  final List<StepItem?> _pickedItem = List.generate(2, (index) {
    return null;
  }, growable: false);

  SubmitModel get submitModel =>
      Provider.of<SubmitModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dict = await submitModel.getDictionary();
      setState(() => _stepItems = dict?['10']);
    });
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

  void _pickContact(int pos) async {
    final result = await FlutterPlatform.pickContact();
    if (result != null) {
      _controllers[pos][0] = result['name'];
      _controllers[pos][1] = result['phone'];
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
        onPressed: () {},
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: InkWell(
                onTap: () => _pickContact(pos),
                child: Image.asset(
                  Drawable.iconContact,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            ),
            isError: _isErrors[pos][0],
          ),
          StepInputField(
            controller: _controllers[pos][1],
            hintText: 'Número de teléfono',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[pos][1],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems,
            pickedItem: _pickedItem[pos],
            onValueChange: (value) => setState(() => _pickedItem[pos] = value),
            hintText: 'Relación',
            isError: _isErrors[pos][2],
          ),
        ],
      ),
    );
  }
}
