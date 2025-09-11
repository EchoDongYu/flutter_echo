import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/common/page_consumer.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/account_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// 图形验证码弹窗
class TraderPasswordDialog extends StatefulWidget {
  final bool hasTransPwd;
  final String? orderGid;
  final VoidCallback onClosing;
  final Function(String) onConfirm;

  const TraderPasswordDialog({
    super.key,
    required this.hasTransPwd,
    required this.orderGid,
    required this.onConfirm,
    required this.onClosing,
  });

  /// 显示图形验证码弹窗
  static Future<String?> show(
    BuildContext context, {
    required bool hasTransPwd,
    required String? orderGid,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: ChangeNotifierProvider(
          create: (_) => AccountModel(),
          builder: (_, _) => PageConsumer<AccountModel>(
            child: TraderPasswordDialog(
              hasTransPwd: hasTransPwd,
              orderGid: orderGid,
              onConfirm: (value) => context.pop(value),
              onClosing: () => context.pop(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<TraderPasswordDialog> createState() => _TraderPasswordDialogState();
}

class _TraderPasswordDialogState extends State<TraderPasswordDialog> {
  final _controllers = List.generate(2, (index) {
    return TextEditingController();
  }, growable: false);
  final List<bool> _obscureText = [true, true];
  bool _isValid = false;

  AccountModel get accountModel =>
      Provider.of<AccountModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      _controllers[i].addListener(_onInputChanged);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// 输入变化监听
  void _onInputChanged() {
    final pwd0 = _controllers[0].text;
    final bool isValid;
    if (widget.hasTransPwd) {
      isValid = pwd0.length == AppConst.passwordLen;
    } else {
      final pwd1 = _controllers[1].text;
      isValid =
          pwd0.length == AppConst.passwordLen &&
          pwd1.length == AppConst.passwordLen;
    }
    if (_isValid != isValid) setState(() => _isValid = isValid);
  }

  void _submitPassword() async {
    final pwd0 = _controllers[0].text;
    if (widget.hasTransPwd) {
      final checkOk = await accountModel.checkTraderPassword(
        password: pwd0,
        orderId: widget.orderGid,
      );
      if (checkOk == true) widget.onConfirm(pwd0);
    } else {
      if (pwd0 != _controllers[1].text) {
        toast(msg: 'La contraseña introducida dos veces no coincide');
        return;
      }
      final setOk = await accountModel.setTraderPassword(password: pwd0);
      if (setOk == true) widget.onConfirm(pwd0);
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
        child: Column(
          children: [
            _buildContent(),
            WidgetHelper.buildBottomTwoButton(
              confirmText: 'Continuar',
              cancelText: 'Cancelar',
              onConfirm: _submitPassword,
              onCancel: widget.onClosing,
              enable: _isValid,
            ),
          ],
        ),
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
              Expanded(
                child: Text(
                  'Certifcación de seguridad de identidad',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 18,
                  ),
                  textAlign: TextAlign.center,
                ),
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
            'Recuerda tu NIP y mantén todas las transacciones de préstamos a seguras!',
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: NowStyles.cardShadows,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!widget.hasTransPwd)
                Text(
                  'NIP',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 16,
                  ),
                ),
              SizedBox(height: 16.h),
              _buildPasswordField('Ingresa el NIP de 4 digitos', 0),
              if (!widget.hasTransPwd) ...[
                SizedBox(height: 16.h),
                _buildPasswordField('Confirma el NIP nuevamente', 1),
              ] else ...[
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13.sp, height: 18 / 13),
                    children: [
                      const TextSpan(
                        text: 'Si olvidaste e NIP, ',
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
                          ..onTap = () {
                            context.pushReplacement(AppRouter.resetTraderPwd);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 36.h),
      ],
    );
  }

  Widget _buildPasswordField(String hintText, int index) {
    final obscureText = _obscureText[index];
    return StepInputField(
      controller: _controllers[index],
      hintText: hintText,
      maxLength: AppConst.passwordLen,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: obscureText,
      suffix: InkWell(
        onTap: () => setState(() => _obscureText[index] = !obscureText),
        child: Image.asset(
          obscureText ? Drawable.iconEyeclose : Drawable.iconEyeopen,
          width: 20.r,
          height: 20.r,
        ),
      ),
    );
  }
}
