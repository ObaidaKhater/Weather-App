import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers/routes_helper.dart';

class LanguageHelper {
  LanguageHelper._();

  static LanguageHelper langHelper = LanguageHelper._();

// check english is current language
  bool isEnglishLang() {
    return (EasyLocalization.of(RouteHelper.routeHelper.navKey.currentContext!)!
            .currentLocale ==
        const Locale('en'));
  }

// get routater direction
  int getRoutateDir() {
    return isEnglishLang() ? 2 : 0;
  }

// togle change language
  changeLanguage() {
    (isEnglishLang())
        ? EasyLocalization.of(RouteHelper.routeHelper.navKey.currentContext!)!
            .setLocale(const Locale('ar'))
        : EasyLocalization.of(RouteHelper.routeHelper.navKey.currentContext!)!
            .setLocale(const Locale('en'));
  }

// change language to arabic
  changeLanguageToArabic() {
    EasyLocalization.of(RouteHelper.routeHelper.navKey.currentContext!)!
        .setLocale(const Locale('ar'));
  }

// change language to english
  changeLanguageToEnglish() {
    EasyLocalization.of(RouteHelper.routeHelper.navKey.currentContext!)!
        .setLocale(const Locale('en'));
  }

// get language code
  String getLanguageCode() {
    return Localizations.localeOf(
            RouteHelper.routeHelper.navKey.currentContext!)
        .languageCode;
  }
}
