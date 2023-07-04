import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helpers/constant.dart';
import 'package:weather_app/helpers/routes_helper.dart';
import 'package:weather_app/pages/choose_location_service_page/choose_location_service_page.dart';
import 'package:weather_app/pages/home_page/widgets/custom_row_text_widget.dart';
import 'package:weather_app/pages/widgets/custom_outline_button_widget.dart';
import 'package:weather_app/providers/home_provider.dart';

class CustomWeatherBoxWidget extends StatelessWidget {
  const CustomWeatherBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, providerHome, x) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding.w),
        color: kSecondaryColor,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle_outlined,
                  color: kWhiteColor,
                  size: 40.h,
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Text(
                    providerHome.currentWeather?.location?.name ?? '-',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: kWhiteColor,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              providerHome.currentWeather?.forecast?.forecastday?.first.date ??
                  '-',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: kWhiteColor.withOpacity(0.5),
                  ),
            ),
            SizedBox(height: 20.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: providerHome.currentWeather?.forecast?.forecastday
                            ?.first.day?.avgtempC
                            .toString() ??
                        '-',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: kWhiteColor,
                          fontSize: 120.sp,
                        ),
                  ),
                  TextSpan(
                    text: '°',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: kWhiteColor.withOpacity(0.5),
                          fontSize: 50.sp,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              providerHome.currentWeather?.forecast?.forecastday?.first.day
                      ?.condition?.text ??
                  '-',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: kWhiteColor,
                    fontSize: 25.sp,
                  ),
            ),
            SizedBox(height: 50.h),
            CustomRowTextWidget(
              title: 'متوسط الرطوبة',
              subtitle: providerHome.currentWeather?.forecast?.forecastday
                      ?.first.day?.avghumidity
                      .toString() ??
                  '-',
            ),
            SizedBox(height: 20.h),
            CustomRowTextWidget(
              title: 'احتمالية هطول الأمطار',
              subtitle:
                  ('${providerHome.currentWeather?.forecast?.forecastday?.first.day?.dailyChanceOfRain ?? '-'} %'),
            ),
            SizedBox(height: 20.h),
            CustomRowTextWidget(
              title: 'فرصة تساقط ثلوج',
              subtitle:
                  ('${providerHome.currentWeather?.forecast?.forecastday?.first.day?.dailyChanceOfSnow ?? '-'} %'),
            ),
            SizedBox(height: 90.h),
            CustomOutlineButtonWidget(
              title: 'اختيار الموقع',
              width: 0.4.sw,
              onTap: () => RouteHelper.routeHelper.push(
                const ChooseLocationServicePage(),
              ),
            )
          ],
        ),
      );
    });
  }
}
