import 'package:flutter/material.dart';
import 'package:flutter_echo/pages/main/home_default_page.dart';
import 'package:flutter_echo/pages/main/home_loan_page.dart';
import 'package:flutter_echo/providers/main_provider.dart';
import 'package:provider/provider.dart';

/// 主页面-首页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MainModel>().getHomeInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (contex, provider, _) {
        return RefreshIndicator(
          onRefresh: () => context.read<MainModel>().getHomeInfo(),
          child: provider.status == 2 ? HomeLoanPage() : HomeDefaultPage(),
        );
      },
    );
  }
}
