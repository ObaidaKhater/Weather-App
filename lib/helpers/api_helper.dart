import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_app/helpers/exception_helper.dart';
import 'package:weather_app/helpers/language_helpers/language_helper.dart';
import 'package:weather_app/helpers/language_helpers/locale_keys.g.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://carswash.elmotamyzon.com/api/',
    ),
  );

// define header
  Map<String, dynamic> getHeader({String? token}) {
    return {
      'Authorization': token,
      'Accept-Language': LanguageHelper.langHelper.getLanguageCode(),
      'Accept': 'application/json',
    };
  }

  // catch dio error
  dioErrorCatch(DioError error) {
    log(error.type.toString());
    log(error.toString(), name: 'Error');
    log(error.response.toString());
    // when error connection
    if (error.type == DioErrorType.connectionError) {
      throw ExceptionHelper(
        message: LocaleKeys.error_massege_no_connect_internet.tr(),
      );
    } else {
      throw ExceptionHelper(
        message: LocaleKeys.error_massege_field_request.tr(),
      );
    }
  }

  // search place from api
  Future<dynamic> searchPlaceFromApi({
    required String placeName,
  }) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=AIzaSyB8900rU0KsSHJd8mRBlmzS9acK3Qb-4OA',
      );
      log(response.data.toString());
      // if status code is 200 (done requset)
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      dioErrorCatch(e);
    } on Exception catch (_) {
      throw ExceptionHelper(
        message: LocaleKeys.error_massege_field_request.tr(),
      );
    }
  }

  // get wheather to day from api
  Future<dynamic> getWatherToDay({
    required String date,
    required double? long,
    required double? laut,
  }) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=6c31a0a0a91040b88dd101504230407&q=$laut,$long&aqi=no&dt=$date&lang=${LanguageHelper.langHelper.getLanguageCode()}',
      );
      // if status code is 200 (done requset)
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      dioErrorCatch(e);
    } on Exception catch (_) {
      throw ExceptionHelper(
        message: LocaleKeys.error_massege_field_request.tr(),
      );
    }
  }
}
