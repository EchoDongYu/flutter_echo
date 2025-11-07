import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/event/event_data.dart';
import 'package:flutter_echo/event/event_service.dart';
import 'package:flutter_echo/pages/app_router.dart';

// import 'package:flutter_echo/services/appsflyer_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/custom_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 设置系统栏样式
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

  // 初始化缓存服务
  await LocalStorage().init();
  tz.initializeTimeZones();
  //
  // await AppsflyerService().init(
  //   'your_dev_key1',  // 替换为你的开发者密钥
  //   'your_app_id1',   // 替换为你的 App ID
  // );

  // 获取安全的内部存储路径
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(EventAdapter())
    ..registerAdapter(EventParamAdapter())
    ..registerAdapter(ActionDataAdapter());
  await EventService.init();
  EventService.generateAppStartId();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 设计稿尺寸
      builder: (context, child) {
        return OKToast(
          radius: 100,
          textPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: MaterialApp.router(
            title: AppConst.applicationName,
            routerConfig: AppRouter.router,
            theme: AppTheme.lightTheme,
            themeMode: ThemeMode.light,
            locale: const Locale('es', 'GT'),
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: scaffoldMessengerKey,
            localizationsDelegates: const [NumericLocalizationDelegate()],
          ),
        );
      },
    );
  }
}
