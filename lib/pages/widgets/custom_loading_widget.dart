import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';

class CustomLoadingWidget extends StatelessWidget {
  final double? size;
  final Color? colro;
  const CustomLoadingWidget({
    Key? key,
    this.size,
    this.colro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size ?? 40.h,
        width: size ?? 40.h,
        child: CircularProgressIndicator(
          color: colro ?? kPrimaryColor,
        ),
      ),
    );
  }
}
