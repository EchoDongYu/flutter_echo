import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/providers/verification_provider.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 更换设备验证弹窗
class DeviceVerifyDialog extends StatefulWidget {
  final VoidCallback onClosing;

  const DeviceVerifyDialog({super.key, required this.onClosing});

  /// 显示更换设备验证弹窗
  static Future<Map?> show(BuildContext context) {
    return showModalBottomSheet<Map>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: ChangeNotifierProvider(
          create: (_) => VerifyModel(),
          builder: (_, _) => PageConsumer<VerifyModel>(
            child: DeviceVerifyDialog(onClosing: () => context.pop()),
          ),
        ),
      ),
    );
  }

  @override
  State<DeviceVerifyDialog> createState() => _DeviceVerifyDialogState();
}

class _DeviceVerifyDialogState extends State<DeviceVerifyDialog>
    with SingleTickerProviderStateMixin {
  final TextEditingController _verifyCtrl = TextEditingController();
  final TextEditingController _imageCtrl = TextEditingController();
  late AnimationController _animationCtrl;
  final FocusNode _focusNode = FocusNode();

  late String _imageUrl;
  String _inputCode = ''; // 验证码
  bool _isCodeValid = false;

  VerifyModel get verifyModel =>
      Provider.of<VerifyModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    _animationCtrl = AnimationController(vsync: this)
      ..repeat(period: const Duration(seconds: 1));
    _verifyCtrl.addListener(_onCodeChanged);
    _imageCtrl.addListener(_onCodeChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final sendOk = await verifyModel.sendVerifyCode();
      if (sendOk == true) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _animationCtrl.dispose();
    _verifyCtrl.dispose();
    _imageCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// 验证码输入变化监听
  void _onCodeChanged() {
    final value = _verifyCtrl.text;
    if (_inputCode != value) {
      setState(() => _inputCode = value);
    }
    final codeValid =
        value.length == AppConst.codeLen &&
        _imageCtrl.text.length == AppConst.captchaLen;
    if (_isCodeValid != codeValid) {
      setState(() => _isCodeValid = codeValid);
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
          child: Text(
            'Autenticacion de inicio de sesion',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 24 / 18,
            ),
            textAlign: TextAlign.center,
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
          child: Consumer<VerifyModel>(
            builder: (context, provider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          text: provider.phoneNumber,
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
                  if (provider.countdown <= 0)
                    InkWell(
                      onTap: () => provider.resendVerifyCode(),
                      child: Text(
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
                    )
                  else
                    Text(
                      'Reenviar (${provider.countdown})',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFF77797B,
                        height: 22 / 14,
                      ),
                    ),
                  if (provider.needCaptcha == true) ..._buildImageCodeArea(),
                ],
              );
            },
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
            controller: _verifyCtrl,
            focusNode: _focusNode,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
            maxLength: AppConst.codeLen,
            maxLines: 1,
            autofocus: false,
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
        controller: _imageCtrl,
        hintText: 'Código de verificación',
        maxLength: AppConst.captchaLen,
        keyboardType: TextInputType.text,
        suffix: _buildCaptcha(),
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
            TextSpan(
              text: 'haga chic aqui',
              style: TextStyle(
                color: NowColors.c0xFF3288F1,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => setState(() {
                  _imageUrl = ApiPath.captchaCode();
                }),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _buildCaptcha() {
    return Container(
      width: 104.w,
      height: 44.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(vertical: 7.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: NowColors.c0xFFC7C7C7, width: 1),
      ),
      child: CachedNetworkImage(
        imageUrl: _imageUrl,
        progressIndicatorBuilder: (context, _, _) {
          return RotationTransition(
            turns: _animationCtrl,
            child: Image.asset(Drawable.iconCaptchaRefresh),
          );
        },
        errorWidget: (_, _, _) => Image.asset(Drawable.iconCaptchaBrokea),
      ),
    );
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
        text: 'Confirmar',
        onPressed: () => verifyModel.checkVerifyCode(
          verifyCode: _verifyCtrl.text,
          imageCode: _imageCtrl.text,
        ),
      ),
    );
  }
}
