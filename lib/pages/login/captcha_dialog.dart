import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/step_input_field.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 图形验证码弹窗
class CaptchaDialog extends StatefulWidget {
  final VoidCallback onClosing;
  final Function(String) onConfirm;

  const CaptchaDialog({
    super.key,
    required this.onConfirm,
    required this.onClosing,
  });

  /// 显示图形验证码弹窗
  static Future<String?> show(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: CaptchaDialog(
          onConfirm: (code) => context.pop(code),
          onClosing: () => context.pop(),
        ),
      ),
    );
  }

  @override
  State<CaptchaDialog> createState() => _CaptchaDialogState();
}

class _CaptchaDialogState extends State<CaptchaDialog>
    with SingleTickerProviderStateMixin {
  late TextEditingController _codeCtrl;
  late AnimationController _animationCtrl;
  late String _imageUrl;
  bool _isCodeValid = false;

  @override
  void initState() {
    _imageUrl = ApiPath.captchaCode();
    _codeCtrl = TextEditingController();
    _codeCtrl.addListener(_onCodeChanged);
    _animationCtrl = AnimationController(vsync: this)
      ..repeat(period: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    _animationCtrl.dispose();
    super.dispose();
  }

  void _onCodeChanged() {
    final codeValid = _codeCtrl.text.length == AppConst.captchaLen;
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
        child: Column(
          children: [
            _buildContent(),
            WidgetHelper.buildBottomButton(
              text: 'Código de verificación',
              enable: _isCodeValid,
              onPressed: () {
                FocusScope.of(context).unfocus();
                widget.onConfirm(_codeCtrl.text);
              },
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
              Text(
                'Código de verificación gráfico',
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: NowStyles.cardShadows,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Recordatorio: la imagen de arriba contiene 4 caracteres, ingrese correctamente el código de verificación.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFF494C4F,
                  height: 18 / 12,
                ),
              ),
              SizedBox(height: 16.h),
              StepInputField(
                controller: _codeCtrl,
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
            ],
          ),
        ),
        SizedBox(height: 36.h),
      ],
    );
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
}
