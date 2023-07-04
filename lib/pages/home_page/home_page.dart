import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helpers/constant.dart';
import 'package:weather_app/pages/home_page/widgets/custom_weather_box_widget.dart';
import 'package:weather_app/pages/widgets/custom_app_bar_widget.dart';
import 'package:weather_app/pages/home_page/widgets/custom_hint_text_widget.dart';
import 'package:weather_app/pages/widgets/custom_loading_widget.dart';
import 'package:weather_app/providers/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // get init method to open home page
      Provider.of<HomeProvider>(context, listen: false)
          .initMethodOpenHomePgae();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, providerHome, x) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
            child: const CustomAppBarWidget(),
          ),
          body: Center(
            child: (providerHome.isLoadingGetCurrentWeather)
                ? const CustomLoadingWidget(colro: kWhiteColor)
                : (providerHome.currentWeather == null)
                    ? const CustomHintTextWidget()
                    : PageView.builder(
                        onPageChanged: (value) => {
                          providerHome.setCurrentDate(numNextDay: value),
                          print(value),
                        },
                        // controller: providerSurah.pageController,
                        itemBuilder: (context, index) =>
                            const CustomWeatherBoxWidget(),
                      ),
          ),
        );
      },
    );
  }
}
