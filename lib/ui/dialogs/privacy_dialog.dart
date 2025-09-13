import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 隐私政策弹窗
class PrivacyDialog extends StatefulWidget {
  final VoidCallback onAgree;
  final VoidCallback onDisagree;

  const PrivacyDialog({
    super.key,
    required this.onAgree,
    required this.onDisagree,
  });

  /// 显示隐私政策弹窗
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => PopScope(
        canPop: false,
        child: PrivacyDialog(
          onAgree: () => context.pop(true),
          onDisagree: () async {
            await LocalStorage().set(AppConst.disclosureKey, false);
            if (context.mounted) context.pop(false);
          },
        ),
      ),
    );
  }

  @override
  State<PrivacyDialog> createState() => _PrivacyDialogState();
}

class _PrivacyDialogState extends State<PrivacyDialog> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _isLoading = true),
          onPageFinished: (_) => setState(() => _isLoading = false),
          onNavigationRequest: (request) {
            // 拦截逻辑（可选）
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(AppConst.h5Privacy));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.8;
    return BottomSheet(
      onClosing: widget.onDisagree,
      enableDrag: false,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(maxHeight: height),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  'Politicas de privacidad',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: NowColors.c0xFF1C1F23,
                    height: 24 / 18,
                  ),
                ),
              ),
              Flexible(child: WebViewWidget(controller: _controller)),
              if (_isLoading)
                const LinearProgressIndicator(
                  color: NowColors.c0xFF3288F1,
                  backgroundColor: NowColors.c0xFFEFF7FF,
                ),
            ],
          ),
          WidgetHelper.buildBottomBlurButton(
            confirmText: 'Aceptar',
            cancelText: 'Discrepar',
            onConfirm: widget.onAgree,
            onCancel: widget.onDisagree,
          ),
        ],
      ),
    );
  }
}
