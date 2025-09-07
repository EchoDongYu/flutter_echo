import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/main/home_default_page.dart';
import 'package:flutter_echo/pages/main/home_loan_page.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/compensation_dialog.dart';
import 'package:flutter_echo/ui/dialogs/disclosure_dialog.dart';
import 'package:flutter_echo/ui/dialogs/privacy_dialog.dart';
import 'package:provider/provider.dart';

/// 主页面-首页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainModel get mainModel => Provider.of<MainModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (LocalStorage().disclosure != true) {
        await _checkAuth(context);
      }
      mainModel.getHomeInfo();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _checkAuth(BuildContext context) async {
    bool? result;
    final compensation = await CompensationDialog.show(context);
    if (compensation == true && context.mounted) {
      final privacy = await PrivacyDialog.show(context);
      if (privacy == true && context.mounted) {
        result = await DisclosureDialog.show(context);
      }
    }
    if (result != true && context.mounted) {
      _checkAuth(context);
    }
  }

  /// 模拟异步刷新
  Future<void> _onRefresh() async {
    await mainModel.getHomeInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (contex, provider, _) {
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: provider.status == 2 ? HomeLoanPage() : HomeDefaultPage(),
        );
      },
    );
  }
}
