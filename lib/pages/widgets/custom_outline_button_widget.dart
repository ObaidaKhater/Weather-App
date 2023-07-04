import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';

class CustomOutlineButtonWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final Function()? onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? titleStyle;

  const CustomOutlineButtonWidget({
    Key? key,
    required this.title,
    this.color,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 343.w,
      height: height ?? 48.h,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          shadowColor: kBlackColor.withOpacity(0.3),
          primary: color ?? kWhiteColor,
          backgroundColor: Colors.transparent,
          side: BorderSide(color: color ?? kWhiteColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12.r,
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle ??
              Theme.of(context).textTheme.headline4!.copyWith(
                    color: color ?? kWhiteColor,
                  ),
        ),
      ),
    );
  }
}
