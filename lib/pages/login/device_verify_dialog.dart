import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 更换设备验证弹窗
class DeviceVerifyDialog extends StatefulWidget {
  /// 手机号码
  final String phoneNumber;
  final VoidCallback onClosing;
  final Function(Map) onConfirm;

  const DeviceVerifyDialog({
    super.key,
    required this.phoneNumber,
    required this.onConfirm,
    required this.onClosing,
  });

  @override
  State<DeviceVerifyDialog> createState() => _DeviceVerifyDialogState();
}

class _DeviceVerifyDialogState extends State<DeviceVerifyDialog> {
  final TextEditingController _verCtrl = TextEditingController();
  final TextEditingController _imgCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // 验证码
  String _inputCode = '';

  @override
  void initState() {
    super.initState();
    _verCtrl.addListener(_onCodeChanged);
  }

  @override
  void dispose() {
    _verCtrl.dispose();
    _imgCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// 验证码输入变化监听
  void _onCodeChanged() {
    final value = _verCtrl.text;
    setState(() {
      _inputCode = value;
    });
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
        child: Column(children: [_buildContent(), _buildBottomButton()]),
      ),
    );
  }

  /// 构建主要内容区域
  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
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
                'Autenticacion de inicio de sesion',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: NowColors.c0xFF1C1F23,
                  height: 24 / 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 24.r, height: 24.r),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: NowColors.c0xFFFFF9EA,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            'Esta verificacion se utiliza para comprobar que no eres un robot y para evitar envios automatizados de spam.',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: NowColors.c0xFFFF9817,
              height: 18 / 13,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 32.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: NowStyles.cardShadows,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14.sp, height: 22 / 14),
                  children: [
                    const TextSpan(
                      text: 'ngresa el codigo de verifcacion enviado a ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                      ),
                    ),
                    TextSpan(
                      text: widget.phoneNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // 验证码输入框
              _buildVerifyCodeField(),
              SizedBox(height: 20.h),
              Text(
                'Reenviar el código',
                style: TextStyle(
                  color: NowColors.c0xFF3288F1,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 22 / 14,
                  decoration: TextDecoration.underline,
                  decorationColor: NowColors.c0xFF3288F1,
                ),
              ),
              Text(
                'Reenviar (59s)',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFF77797B,
                  height: 22 / 14,
                ),
              ),
              ..._buildImageCodeArea(),
            ],
          ),
        ),
        SizedBox(height: 36.h),
      ],
    );
  }

  /// 构建验证码输入框 - 新的实现方式
  Widget _buildVerifyCodeField() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildCodeDisplay(0),
            _buildCodeDisplay(1),
            _buildCodeDisplay(2),
            _buildCodeDisplay(3),
          ],
        ),
        Positioned.fill(
          child: TextField(
            controller: _verCtrl,
            focusNode: _focusNode,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
            maxLength: 8,
            maxLines: 1,
            showCursor: false,
            enableInteractiveSelection: false,
            style: const TextStyle(color: Colors.transparent),
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildImageCodeArea() {
    return [
      SizedBox(height: 32.h),
      StepInputField(
        controller: _imgCtrl,
        hintText: 'Código de verificación',
        maxLength: AppConst.codeLength,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        suffix: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: 104.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: NowColors.c0xFFC7C7C7, width: 1),
            ),
          ),
        ),
      ),
      SizedBox(height: 16.h),
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 13.sp, height: 18 / 13),
          children: [
            const TextSpan(
              text: 'Necesita cambiar la imagen, ',
              style: TextStyle(
                color: NowColors.c0xFF494C4F,
                fontWeight: FontWeight.w400,
              ),
            ),
            const TextSpan(
              text: 'haga chic aqui',
              style: TextStyle(
                color: NowColors.c0xFF3288F1,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  /// 构建单个验证码显示框
  Widget _buildCodeDisplay(int index) {
    final hasValue = index < _inputCode.length;
    final value = hasValue ? _inputCode[index] : '';
    final isActive = index == _inputCode.length;

    return Container(
      width: 56.r,
      height: 56.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: hasValue
            ? NowColors.c0xFF3288F1
            : (isActive ? NowColors.c0xFFEFF7FF : Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(56)),
        border: hasValue
            ? null
            : Border.all(
                width: 1,
                color: isActive ? NowColors.c0xFF3288F1 : NowColors.c0xFF1C1F23,
              ),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          height: 28 / 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// 构建底部按钮
  Widget _buildBottomButton() {
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
        text: 'Código de verificación',
        onPressed: () => widget.onConfirm({'first': _verCtrl.text}),
      ),
    );
  }
}
