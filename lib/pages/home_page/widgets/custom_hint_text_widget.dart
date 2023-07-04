import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';
import 'package:weather_app/helpers/routes_helper.dart';
import 'package:weather_app/pages/choose_location_service_page/choose_location_service_page.dart';
import 'package:weather_app/pages/widgets/custom_button_widget.dart';

class CustomHintTextWidget extends StatelessWidget {
  const CustomHintTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'لا توجد بيانات حالياً',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (kHorizontalPadding * 5).w),
          child: Text(
            'يرجى اختيار الموقع الذي تريد معرفة حالة الطقس له',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: kGray2Color,
                ),
          ),
        ),
        SizedBox(height: 20.h),
        CustomButtonWidget(
          width: 0.4.sw,
          title: 'اختيار الموقع',
          onTap: () => RouteHelper.routeHelper.push(
            const ChooseLocationServicePage(),
          ),
        )
      ],
    );
  }
}
