import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helpers/api_helper.dart';
import 'package:weather_app/helpers/routes_helper.dart';
import 'package:weather_app/helpers/ui_helper.dart';
import 'package:weather_app/models/weather_day_response.dart';
import 'package:weather_app/providers/location_service_provider.dart';

class HomeProvider extends ChangeNotifier {
  // current date time
  DateTime currentDateTime = DateTime.now();
  // loading to get current wather
  bool isLoadingGetCurrentWeather = false;
  // current weather to day
  GetWeatherDayResponse? currentWeather;

// init method open home page
  initMethodOpenHomePgae() async {
    // start loading
    setLoadingGetCurrentWeather(true);
    // get current user location
    LatLng currentUserLocation = await Provider.of<LocationServiceProvider>(
            RouteHelper.routeHelper.navKey.currentContext!,
            listen: false)
        .getCurrentPosition();
    // set current user location to current service location add draw markers
    Provider.of<LocationServiceProvider>(
            RouteHelper.routeHelper.navKey.currentContext!,
            listen: false)
        .clickOnServicesMap(position: currentUserLocation);

    // get current wather
    await getCurrentWeather();
    // stop loading
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) => setLoadingGetCurrentWeather(false),
    );
  }

  // set loading to get current wather
  setLoadingGetCurrentWeather(bool value) {
    isLoadingGetCurrentWeather = value;
    notifyListeners();
  }

  // get current weather to day
  getCurrentWeather({
    bool withLoading = true,
  }) async {
    try {
      // start loading
      if (withLoading) {
        setLoadingGetCurrentWeather(true);
      }
      // set requset
      dynamic responseResult = await ApiHelper.apiHelper.getWatherToDay(
        date: UiHelper.uiHelper.printDate(currentDateTime),
        laut: Provider.of<LocationServiceProvider>(
                RouteHelper.routeHelper.navKey.currentContext!,
                listen: false)
            .currentServicePosition
            .latitude,
        long: Provider.of<LocationServiceProvider>(
                RouteHelper.routeHelper.navKey.currentContext!,
                listen: false)
            .currentServicePosition
            .longitude,
      );
      GetWeatherDayResponse getWeatherDayResponse =
          GetWeatherDayResponse.fromJson(responseResult);
      if (getWeatherDayResponse.forecast != null) {
        // set current weather value
        currentWeather = getWeatherDayResponse;
        notifyListeners();
      } else {
        // show faild message
        UiHelper.uiHelper.showMessage(
          message: getWeatherDayResponse.error?.message ??
              'حدث خطأ اثناء جلب البيانات',
        );
      }
      // stop loading
      if (withLoading) {
        setLoadingGetCurrentWeather(false);
      }
    } on Exception catch (e) {
      // stop loading
      if (withLoading) {
        setLoadingGetCurrentWeather(false);
      }
      UiHelper.uiHelper.showMessage(message: e.toString());
    }
  }

  // set new current date
  setCurrentDate({required int numNextDay}) {
    // set new value
    currentDateTime = DateTime.now().add(Duration(days: numNextDay));
    // get weather to new date
    getCurrentWeather(withLoading: false);
  }
}
