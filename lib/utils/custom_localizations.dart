import 'package:flutter/material.dart';

class _NumericMaterialLocalizations extends DefaultMaterialLocalizations {
  const _NumericMaterialLocalizations();

  @override
  String formatMonthYear(DateTime date) {
    // 默认会返回 "2025年9月" 改为纯数字 "09/2025"
    return '${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}

class NumericLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const NumericLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return const _NumericMaterialLocalizations();
  }

  @override
  bool shouldReload(NumericLocalizationDelegate old) => false;
}
