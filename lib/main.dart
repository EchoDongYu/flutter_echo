import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/providers/app_provider.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 设置系统状态栏&导航栏样式
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  // 设置屏幕方向
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // 初始化服务
  await _initServices();

  runApp(const MyApp());
}

/// 初始化服务
Future<void> _initServices() async {
  // 初始化缓存服务
  await LocalStorage().init();

  // 初始化应用状态管理
  final appProvider = AppProvider();
  await appProvider.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 设计稿尺寸
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => AppProvider(),
          child: MaterialApp.router(
            title: AppConst.applicationName,
            routerConfig: AppRouter.router,
            theme: AppTheme.lightTheme,
            themeMode: ThemeMode.light,
            locale: const Locale('es', 'GT'),
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: scaffoldMessengerKey,
          ),
        );
      },
    );
  }
}
