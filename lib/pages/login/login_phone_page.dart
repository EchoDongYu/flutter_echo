import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/ui/widgets/common_button.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/resource_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// 登录手机号输入页面
class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({super.key});

  @override
  State<LoginPhonePage> createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isPhoneValid = false;
  bool _isExpanded = false;
  int _phoneLength = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPhoneChanged);
    _controller.addListener(_onFocusChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// 手机号输入变化监听
  void _onPhoneChanged() {
    final value = _controller.text;
    final isValid = value.length >= 8;
    setState(() {
      _phoneLength = value.length;
      _isPhoneValid = isValid;
    });
  }

  /// 焦点变化监听
  void _onFocusChanged() {
    final expanded = _controller.text.isNotEmpty || _focusNode.hasFocus;
    if (_isExpanded != expanded) {
      setState(() {
        _isExpanded = expanded;
      });
    }
  }

  /// 下一步按钮点击
  void _onNextPressed() {
    if (!_isPhoneValid) return;
    final phone = _controller.text;
    context.push('${AppRouter.loginCode}?${NavKey.phone}=$phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 308.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [NowColors.c0xFF3288F1, NowColors.c0xFF4FAAFF],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Image.asset(R.drawable('login_top_bg')),
          ),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Registro/Conecte-se'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Logo区域
                          Container(
                            width: 80.w,
                            height: 80.h,
                            margin: EdgeInsets.only(top: 28.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: NowColors.c0xFF3288F1,
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(
                                width: 3,
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: const Icon(
                              Icons.phone_android,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          // 内容区域
                          _buildContentCard(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建内容卡片
  Widget _buildContentCard() {
    return Container(
      margin: EdgeInsets.only(top: 36.h),
      padding: EdgeInsets.fromLTRB(16.w, 28.h, 16.w, 40.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: NowStyles.cardShadows,
      ),
      child: Column(
        children: [
          Text(
            'Utilice su número de teléfono para registrarse/ entrar',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: NowColors.c0xFF1C1F23,
              height: 30 / 20,
            ),
          ),
          SizedBox(height: 32.h),
          // 手机号输入框
          _buildPhoneField(),
          SizedBox(height: 32.h),
          // 发送按钮
          EchoPrimaryButton(
            text: 'Próximo passo',
            onPressed: _isPhoneValid ? _onNextPressed : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // hintText
        if (!_isExpanded)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              'Número de teléfono',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFF77797B,
                height: 24 / 16,
              ),
            ),
          ),
        Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? NowColors.c0xFF3288F1
                  : NowColors.c0xFFD8D8D8,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // labelText
                    if (_isExpanded)
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, top: 4.h),
                        child: Text(
                          'Número de teléfono',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: NowColors.c0xFF77797B,
                            height: 16 / 12,
                          ),
                        ),
                      ),
                    TextField(
                      focusNode: _focusNode,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.send,
                      maxLength: 8,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                        height: 22 / 16,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        counterText: '',
                        isCollapsed: _isExpanded,
                        contentPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
                        prefix: Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: NowColors.c0xFFEFF7FF,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            border: Border.all(
                              color: NowColors.c0xFF3288F1,
                              width: 0.5,
                            ),
                          ),
                          child: Text(
                            '+502',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: NowColors.c0xFF3288F1,
                              height: 14 / 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // suffixIcon
              if (_isExpanded)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$_phoneLength/8',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFFB0B1B2,
                        height: 20 / 13,
                      ),
                    ),
                    SizedBox(width: 9.w),
                    InkWell(
                      onTap: () => _controller.clear(),
                      child: Container(
                        width: 18.w,
                        height: 18.w,
                        decoration: BoxDecoration(
                          color: NowColors.c0xFFB0B1B2,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ),
                    SizedBox(width: 13.w),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
