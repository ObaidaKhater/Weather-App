import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';

class CustomHeaderSheetWidget extends StatelessWidget {
  const CustomHeaderSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: kGray1Color,
        borderRadius: BorderRadius.circular(100.r),
      ),
    );
  }
}
