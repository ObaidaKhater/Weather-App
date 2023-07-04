import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/helpers/constant.dart';
import 'package:weather_app/helpers/routes_helper.dart';
import 'package:weather_app/pages/widgets/custom_button_widget.dart';
import 'package:weather_app/pages/widgets/custom_header_sheet_widget.dart';
import 'package:weather_app/pages/widgets/custom_search_text_field_widget.dart';
import 'package:weather_app/providers/home_provider.dart';
import 'package:weather_app/providers/location_service_provider.dart';

class CustomServiceLocationDataSheet extends StatelessWidget {
  const CustomServiceLocationDataSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationServiceProvider, HomeProvider>(
        builder: (context, providerLocationService, providerHome, x) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding.w),
              child: (providerLocationService.markers.isEmpty)
                  ? Column(
                      children: [
                        SizedBox(height: 9.h),
                        const Center(child: CustomHeaderSheetWidget()),
                        SizedBox(height: 20.h),
                        Text(
                          'اختر موقع الخدمة',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'قم بإختيار موقع الخدمة من خلال الضغط فوق موقعك على الخريطة ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.h),
                        const Center(child: CustomHeaderSheetWidget()),
                        SizedBox(height: 19.h),
                        const CustomSearchTextFieldWidget(
                          hintText: 'بحث عن موقع',
                        ),
                        SizedBox(height: 19.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_history,
                              color: kGrayColor,
                            ),
                            SizedBox(width: 25.w),
                            Flexible(
                              child: Text(
                                providerLocationService.serviceAddress,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        CustomButtonWidget(
                          title: 'تأكيد',
                          onTap: () {
                            // close current page
                            RouteHelper.routeHelper.pop();
                            // get current weather
                            providerHome.getCurrentWeather();
                          },
                        ),
                        // SizedBox(height: 30.h),
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}
