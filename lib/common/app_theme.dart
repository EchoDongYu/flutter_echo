import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NowColors {
  //主题色
  static const Color c0xFF3288F1 = Color(0xFF3288F1);
  static const Color c0xFFEFF7FF = Color(0xFFEFF7FF);
  static const Color c0xFFFF9817 = Color(0xFFFF9817);
  static const Color c0xFFFFF9EA = Color(0xFFFFF9EA);
  static const Color c0xFFFB4F34 = Color(0xFFFB4F34);
  static const Color c0xFFFFF4F0 = Color(0xFFFFF4F0);
  static const Color c0xFF3EB34D = Color(0xFF3EB34D);
  static const Color c0xFFECF7ED = Color(0xFFECF7ED);
  static const Color c0xFF4FAAFF = Color(0xFF4FAAFF);
  static const Color c0xFF3389F2 = Color(0xFF3389F2);
  static const Color c0x474CA6FD = Color(0x474CA6FD);

  //文字颜色
  static const Color c0xFF1C1F23 = Color(0xFF1C1F23);
  static const Color c0xFF494C4F = Color(0xFF494C4F);
  static const Color c0xFF77797B = Color(0xFF77797B);
  static const Color c0xFFB0B1B2 = Color(0xFFB0B1B2);

  //背景色
  static const Color c0xFFF3F3F5 = Color(0xFFF3F3F5);

  //分割线
  static const Color c0xFFD8D8D8 = Color(0xFFD8D8D8);
  static const Color c0xFFC7C7C7 = Color(0xFFC7C7C7);
}

class NowStyles {
  static const List<BoxShadow> cardShadows = [
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 2),
      blurRadius: 5,
      spreadRadius: 2,
    ),
  ];

  static const List<BoxShadow> bottomShadows = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 0),
      blurRadius: 16,
      spreadRadius: 2,
    ),
  ];
}

/// 应用主题配置
class AppTheme {
  /// 亮色主题
  static ThemeData get lightTheme {
    return ThemeData(
      // 主色调
      primarySwatch: Colors.blue,
      primaryColor: NowColors.c0xFF3288F1,

      // 沉浸的关键代码
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // 去除状态栏遮罩
          statusBarIconBrightness: Brightness.dark, // 状态栏图标字体颜色
          systemNavigationBarColor: Colors.amber, // 底部导航栏颜色
        ),
      ),

      // 颜色方案
      colorScheme: ColorScheme.fromSeed(
        seedColor: NowColors.c0xFF3288F1,
        brightness: Brightness.light,
      ),

      // 分割线主题
      dividerTheme: const DividerThemeData(
        color: NowColors.c0xFFC7C7C7,
        thickness: 1,
        space: 1,
      ),
    );
  }

  /// 暗色主题
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: NowColors.c0xFF3288F1,

      // 沉浸的关键代码
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // 去除状态栏遮罩
          statusBarIconBrightness: Brightness.dark, // 状态栏图标字体颜色
          systemNavigationBarColor: Colors.amber, // 底部导航栏颜色
        ),
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: NowColors.c0xFF3288F1,
        brightness: Brightness.dark,
      ),

      dividerTheme: const DividerThemeData(
        color: NowColors.c0xFFC7C7C7,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
