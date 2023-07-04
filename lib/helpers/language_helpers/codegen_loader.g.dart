// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "error_massege": {
    "field_request": "An error occurred during the operation, please try again",
    "no_connect_internet": "Please check your internet connection and try again",
    "no_data": "No Data Now",
    "no_account": "This account is not registered"
  }
};
static const Map<String,dynamic> ar = {
  "error_massege": {
    "field_request": "حدث خطأ أثناء العملية ، يرجى المحاولة مرة أخرى",
    "no_connect_internet": "يرجى التحقق من اتصالك بالانترنت واعادة المحاولة",
    "no_data": "لا توجد بيانات حالياً",
    "no_account": "هذا الحساب غير مسجل"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
