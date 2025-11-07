import 'package:flutter/material.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/main/home_default_page.dart';
import 'package:flutter_echo/pages/main/home_loan_page.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:provider/provider.dart';

/// 主页面-首页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MainModel>().getHomeInfo();
      _showNoticeDialog();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  //展示公告弹框
  Future<void> _showNoticeDialog() async {
    NoticeMainResp? noticeMainResp = await context
        .read<MainModel>()
        .getNoticeMain();
    if (noticeMainResp != null) {
      if (context.mounted) {
        final result = await PromptDialog.show(
          context: context,
          title: noticeMainResp.title ?? "",
          content: noticeMainResp.content ?? "",
          confirmText: 'OK',
        );
      }
    }
  }

  @override
  void didPopNext() {
    if (LocalStorage().get(AppConst.homeRefreshKey) == true) {
      LocalStorage().set(AppConst.homeRefreshKey, false);
      context.read<MainModel>().getHomeInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (contex, provider, _) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<MainModel>().getHomeInfo();
            _showNoticeDialog();
          },
          child: provider.status == 2 ? HomeLoanPage() : HomeDefaultPage(),
        );
      },
    );
  }
}
