import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebPage extends StatefulWidget {
  final String? title;
  final String url;

  const CommonWebPage({super.key, this.title, required this.url});

  @override
  State<CommonWebPage> createState() => _CommonWebPageState();
}

class _CommonWebPageState extends State<CommonWebPage> {
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
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                if (title != null) EchoTopBar(title: title),
                if (_isLoading)
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                    child: const LinearProgressIndicator(
                      color: NowColors.c0xFF3288F1,
                      backgroundColor: NowColors.c0xFFEFF7FF,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                Expanded(child: WebViewWidget(controller: _controller)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
