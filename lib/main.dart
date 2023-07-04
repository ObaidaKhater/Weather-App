import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/helpers/routes_helper.dart';
import 'package:weather_app/helpers/shared_preferences_helper.dart';
import 'package:weather_app/helpers/theme_helper.dart';
import 'package:weather_app/pages/splash_page/splash_page.dart';
import 'package:weather_app/providers/home_provider.dart';
import 'package:weather_app/providers/location_service_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init shared preferences
  await SharedPreferencesHelper.sharedPreferencesHelper.initSharedPreferences();

  // run app
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      saveLocale: true,
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<LocationServiceProvider>(
          create: (context) => LocationServiceProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: RouteHelper.routeHelper.navKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeHelper.themeHelper.lightTheme,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
