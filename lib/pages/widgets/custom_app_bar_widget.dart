import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';

class CustomAppBarWidget extends StatelessWidget {
  final Widget? leading;
  final List<Widget>? actions;
  const CustomAppBarWidget({
    Key? key,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: kBlackColor.withOpacity(0.22),
      title: Hero(
        tag: 'logo',
        child: Image.asset(
          kLogoImage,
          height: 42.h,
        ),
      ),
      leading: leading,
      actions: actions,
    );
  }
}
