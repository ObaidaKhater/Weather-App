import 'package:flutter/material.dart';
import 'package:weather_app/helpers/constant.dart';

class CustomRowTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomRowTextWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title :',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: kWhiteColor,
                ),
          ),
          TextSpan(
            text: '\t\t\t\t$subtitle',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: kWhiteColor.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }
}
