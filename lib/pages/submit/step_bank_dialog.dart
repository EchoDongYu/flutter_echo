import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/providers/bank_provider.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/ui/widgets/step_select_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 添加银行卡弹窗
class StepBankDialog extends StatefulWidget {
  final VoidCallback onClosing;

  const StepBankDialog({super.key, required this.onClosing});

  /// 显示添加银行卡弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider(
        create: (_) => BankModel(),
        builder: (_, _) => PageConsumer<BankModel>(
          child: StepBankDialog(onClosing: () => context.pop(false)),
        ),
      ),
    );
  }

  @override
  State<StepBankDialog> createState() => _StepBankDialogState();
}

class _StepBankDialogState extends State<StepBankDialog> {
  final _isErrors = List.generate(4, (index) {
    return false;
  }, growable: false);
  final _controllers = List.generate(2, (index) {
    return TextEditingController();
  }, growable: false);
  List<BankVOResp$Item>? _bankItems;
  BankVOResp$Item? _pickedBank;
  List<DictItem>? _stepItems;
  DictItem? _pickedType;
  String? _numberError;

  BankModel get bankModel => Provider.of<BankModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _controllers[0].addListener(() => _onInputChanged(2));
    _controllers[1].addListener(() => _onInputChanged(3));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result = await bankModel.queryBankList();
      setState(() {
        _bankItems = result?.first;
        _stepItems = result?.second;
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
    final text0 = _controllers[0].text;
    final text1 = _controllers[1].text;
    String? numberError;
    if (text0.isNotEmpty && text1.isNotEmpty) {
      if (text0 != text1) {
        numberError = _errorTip[0];
      } else {
        final bankSong = _pickedBank?.songODigits as Map?;
        final bankType = _pickedType?.key.toString();
        if (bankSong != null && bankType != null) {
          final lengthList = (bankSong[bankType] as String).split(',');
          if (!lengthList.contains(text0.length.toString())) {
            numberError = _errorTip[1];
          }
        }
      }
    }
    final isError2 = text0.isEmpty || numberError != null;
    final isError3 = text1.isEmpty || numberError != null;
    setState(() {
      _isErrors[0] = _pickedBank == null;
      _isErrors[1] = _pickedType == null;
      _isErrors[2] = isError2;
      _isErrors[3] = isError3;
      _numberError = numberError;
    });
    if (!_isErrors.contains(true)) {
      final result = await bankModel.submitBank(
        bank: _pickedBank,
        type: _pickedType?.key,
        inputs: _controllers.map((it) => it.text).toList(),
      );
      if (result?.zj1m73OIsBindSuccess == true && context.mounted) {
        context.pop(true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: widget.onClosing,
      enableDrag: false,
      backgroundColor: NowColors.c0xFFF3F3F5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [_buildContent(), _buildBottomButton(context)],
          ),
        ),
      ),
    );
  }

  /// 构建主要内容区域
  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: widget.onClosing,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  width: 24.r,
                  height: 24.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: BoxBorder.all(
                      color: NowColors.c0xFF1C1F23,
                      width: 1.6.w,
                    ),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: NowColors.c0xFF1C1F23,
                    size: 16,
                  ),
                ),
              ),
              Text(
                'Conta Bancaria',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 24 / 18,
                ),
              ),
              SizedBox(width: 24.r, height: 24.r),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Consumer<BankModel>(
            builder: (context, provider, _) {
              return Text(
                'El titular de la tarjeta debe estar debajo de la CUI (${provider.cuiNumber}) que completó cuando presentó la solicitud; ',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFF494C4F,
                  height: 20 / 13,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        _buildFormArea(),
        SizedBox(height: 36.h),
      ],
    );
  }

  /// 构建表单区域
  Widget _buildFormArea() {
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
          StepSelectField.pickBank(
            context,
            items: _bankItems,
            prefix: _buildPickedLogo(),
            pickedItem: _pickedBank,
            onValueChange: (value) => setState(() {
              _pickedBank = value;
              _isErrors[0] = false;
            }),
            hintText: 'Banco',
            isError: _isErrors[0],
            errorText: _errorHint[0],
          ),
          StepSelectField.pickItem(
            context,
            items: _stepItems,
            pickedItem: _pickedType,
            onValueChange: (value) => setState(() {
              _pickedType = value;
              _isErrors[1] = false;
            }),
            hintText: 'Elige su tipo de cuenta',
            isError: _isErrors[1],
            errorText: _errorHint[1],
          ),
          StepInputField(
            controller: _controllers[0],
            hintText: 'Número de cuenta bancaria',
            maxLength: 18,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[2],
            errorText: _numberError ?? _errorHint[2],
          ),
          StepInputField(
            controller: _controllers[1],
            hintText: 'Confirma su cuenta bancaria nuevamente',
            maxLength: 18,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            isError: _isErrors[3],
            errorText: _numberError ?? _errorHint[2],
          ),
        ],
      ),
    );
  }

  /// 构建银行 Logo
  Widget? _buildPickedLogo() {
    final logo = _pickedBank?.m871v6OBankLogo;
    if (logo == null) return null;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: NowColors.c0xFFD8D8D8, width: 0.6.w),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: CachedNetworkImage(
          imageUrl: logo,
          height: 22.h,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  /// 构建底部按钮
  Widget _buildBottomButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color(0xD9FFFFFF), width: 1),
        boxShadow: NowStyles.bottomShadows,
      ),
      child: EchoPrimaryButton(
        text: 'Vincular la tarjeta bancaria',
        onPressed: () => _submitData(context),
      ),
    );
  }

  static const _errorHint = [
    'Por favor elige banco',
    'Por favor elige elige tu tipo de cuenta',
    'Por favor ingresa tus cuenta bancaria',
  ];

  static const _errorTip = [
    'Los números de cuenta ingresados ​dos veces no coinciden',
    'La cuenta ingresó nk condicide con el banco seleccionado',
  ];
}
