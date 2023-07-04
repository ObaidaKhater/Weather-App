import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final TextStyle? titleStyle;
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadius? borderRadius;

  const CustomButtonWidget({
    Key? key,
    required this.title,
    this.titleStyle,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12.r),
      child: SizedBox(
        width: width ?? 343.w,
        height: height ?? 48.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: (onTap == null)
                ? null
                : LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      color ?? kPrimaryColor,
                      color ?? kSecondaryColor,
                    ],
                  ),
            boxShadow: onTap == null
                ? null
                : <BoxShadow>[
                    BoxShadow(
                      color: color?.withOpacity(0.24) ??
                          kPrimaryColor.withOpacity(0.24),
                      blurRadius: 4,
                    )
                  ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: kBlackColor,
              shadowColor: Colors.transparent,
            ),
            onPressed: onTap,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle ??
                    Theme.of(context).textTheme.headline4!.copyWith(
                          color: kWhiteColor,
                        ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
