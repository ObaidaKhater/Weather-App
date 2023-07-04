import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';

class ThemeHelper {
  ThemeHelper._();

  static ThemeHelper themeHelper = ThemeHelper._();
  // Light theme
  ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    // brightness: Brightness.dark,
    // unselectedWidgetColor: Colors.red,
    scaffoldBackgroundColor: kSecondaryColor,

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kSecondaryColor, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kSecondaryColor, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: kSecondaryColor, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(kPrimaryColor),
      side: const BorderSide(color: kGray2Color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return kPrimaryColor;
          }
          return kGray2Color;
        },
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: kBlackColor,
        size: 22.r,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      iconTheme: IconThemeData(
        color: kBlackColor,
        size: 20.r,
      ),
      backgroundColor: kSecondaryColor,
    ),
    dividerTheme: const DividerThemeData(
      color: kGray4Color,
      thickness: 1,
      endIndent: kHorizontalPadding,
      indent: kHorizontalPadding,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: kBlack1Color,
        fontFamily: FONT_FAMILY,
      ),
      headline2: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: kBlack1Color,
        fontFamily: FONT_FAMILY,
      ),
      headline3: TextStyle(
        fontSize: 16.sp,
        color: kBlack1Color,
        fontWeight: FontWeight.w500,
        fontFamily: FONT_FAMILY,
      ),
      headline4: TextStyle(
        fontSize: 14.sp,
        color: kBlack1Color,
        fontWeight: FontWeight.w500,
        fontFamily: FONT_FAMILY,
      ),
      headline5: TextStyle(
        fontSize: 12.sp,
        color: kBlack1Color,
        fontWeight: FontWeight.w500,
        fontFamily: FONT_FAMILY,
      ),
      headline6: TextStyle(
        fontSize: 15.sp,
        color: kBlack1Color,
        fontWeight: FontWeight.w400,
        fontFamily: FONT_FAMILY,
      ),
      subtitle1: TextStyle(
        fontSize: 20.sp,
        color: kBlack1Color,
        fontWeight: FontWeight.w500,
        fontFamily: FONT_FAMILY,
      ),
    ),
  );

//   // Dark Theme -(When need add dark theme)-------
//   ThemeData darkTheme = ThemeData.dark().copyWith(
//     primaryColor: kPrimaryColor,
//     brightness: Brightness.dark,
//     unselectedWidgetColor: Colors.red,
//     scaffoldBackgroundColor: kBlack1Color,
//     backgroundColor: Colors.grey.shade800,
//     dividerColor: Colors.grey.shade800,
//     hoverColor: Colors.grey.shade600,
//     shadowColor: Colors.black.withOpacity(0.2),
//     colorScheme: const ColorScheme.dark().copyWith(
//       primary: kPrimaryColor,
//       secondary: kSecondaryColor,
//     ),
//     appBarTheme: const AppBarTheme(
//       systemOverlayStyle: SystemUiOverlayStyle.dark,
//     ),
//     iconTheme: const IconThemeData(color: kWhiteColor),
//     toggleableActiveColor: kBlack1Color,
//     checkboxTheme: CheckboxThemeData(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4.r),
//       ),
//       side: const BorderSide(
//         width: 1.5,
//         color: kGrayColor,
//       ),
//       // splashRadius: 0,
//     ),
//     // dividerColor: Colors.transparent,
//     textTheme: TextTheme(
//       headline1: TextStyle(
//         color: kGrayColor,
//         fontSize: 13.sp,
//         fontWeight: FontWeight.w400,
//         fontFamily: 'Tajawal',
//       ),
//       headline6: TextStyle(
//         fontSize: 20.sp,
//         color: kWhiteColor,
//         fontWeight: FontWeight.bold,
//         fontFamily: 'Tajawal',
//       ),
//       overline: TextStyle(
//         fontWeight: FontWeight.w600,
//         fontSize: 12.sp,
//         decoration: TextDecoration.lineThrough,
//         color: kWhiteColor.withOpacity(0.55),
//       ),
//       subtitle1: TextStyle(
//         fontSize: 14.sp,
//         color: kWhiteColor,
//         fontWeight: FontWeight.w500,
//         fontFamily: 'Tajawal',
//       ),

//       // // -----------------
//       // headline2: TextStyle(
//       //     color: kWhiteColor,
//       //     fontSize: 17.sp,
//       //     fontWeight: FontWeight.w600,
//       //     fontFamily: 'Tajawal'),
//       // headline5: TextStyle(
//       // fontSize: 16.sp,
//       // color: kGray1Color,
//       // fontWeight: FontWeight.w500,
//       //     fontFamily: 'Tajawal'),
//       // headline3: TextStyle(
//       //     color: kWhiteColor,
//       //     fontSize: 15.sp,
//       //     fontWeight: FontWeight.w500,
//       //     fontFamily: 'Tajawal'),
//       // bodyText2: TextStyle(
//       //     fontSize: 20.sp,
//       //     color: kWhiteColor,
//       //     fontWeight: FontWeight.bold,
//       //     fontFamily: 'Tajawal'),

//       // headline4: TextStyle(
//       //     fontSize: 32.sp,
//       //     fontWeight: FontWeight.bold,
//       //     color: kWhiteColor,
//       //     fontFamily: 'Tajawal'),
//       // //
//       // bodyText1: TextStyle(
//       //     fontSize: 10.sp,
//       //     color: kWhiteColor,
//       //     fontWeight: FontWeight.w500,
//       //     fontFamily: 'Tajawal'),
//       // subtitle2: TextStyle(
//       //     fontWeight: FontWeight.w600,
//       //     fontSize: 12.sp,
//       //     color: kWhiteColor,
//       //     fontFamily: 'Tajawal'),
//       // headlineLarge: TextStyle(
//       //     fontSize: 27.sp,
//       //     color: kWhiteColor,
//       //     fontWeight: FontWeight.bold,
//       //     fontFamily: 'Tajawal'),
//     ),
//   );
}
