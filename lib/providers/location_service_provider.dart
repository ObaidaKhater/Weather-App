import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:weather_app/helpers/api_helper.dart';
import 'package:weather_app/helpers/language_helpers/language_helper.dart';
import 'package:weather_app/helpers/ui_helper.dart';
import 'package:weather_app/models/place_auto_complete_response.dart';

class LocationServiceProvider extends ChangeNotifier {
  // marker services map
  Set<Marker> markers = {};
  // current value zoom services map
  double zoomMap = 16.61;
  // current location services map
  LatLng currentServicePosition =
      const LatLng(25.23466391872581, 45.313781002790776);
  // service address text
  String serviceAddress = '';
  // // init google map controller
  // late GoogleMapController googleMapController;
  // loading open service map
  bool loadingOpenServiceMap = false;
// google map controller
  GoogleMapController? googleMapController;

// set value loading open service map
  setLoadingOpenServiceMap(bool value) {
    loadingOpenServiceMap = value;
    notifyListeners();
  }

  // set marker
  setMarker(LatLng latLng) async {
    // set new value current location service
    currentServicePosition = latLng;
    notifyListeners();
    // remove all marker
    markers = {};
    // add new marker
    markers.add(
      Marker(
        markerId: const MarkerId('service_location'),
        position: latLng,
      ),
    );
    notifyListeners();
  }

  // set address to branch marker
  setServiceAddress(LatLng latLng) async {
    // get address
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
      localeIdentifier: LanguageHelper.langHelper.getLanguageCode(),
    );
    // set value address
    serviceAddress =
        '${placemarks.first.country ?? ''} - ${placemarks.first.administrativeArea ?? ''} - ${placemarks.first.name ?? ''} - ${placemarks.first.locality ?? ''} - ${placemarks.first.street ?? ''}';
    notifyListeners();
  }

  // get handle location permission
  Future<bool> handleLocationPermission() async {
    LocationPermission permission;
    //// when you need not get location Except user click enable location service
    // bool serviceEnabled;
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   UiHelper.uiHelper.showMessage(
    //     message: 'Location services are disabled. Please enable the services',
    //   );
    //   return false;
    // }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        UiHelper.uiHelper.showMessage(
          message: 'Location permissions are denied',
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      UiHelper.uiHelper.showMessage(
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
      );
      return false;
    }
    return true;
  }

// get current user position
  Future<LatLng> getCurrentPosition() async {
    try {
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) {
        return const LatLng(25.23466391872581, 45.313781002790776);
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // returen my current location
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      UiHelper.uiHelper.showMessage(message: e.toString());
      return const LatLng(25.23466391872581, 45.313781002790776);
    }
  }

  // init method when open location service page
  initOpenAddLocationServicePage() async {
    // get current user location
    LatLng currentUserLocation = await getCurrentPosition();
    // set current user location to current service location add draw markers
    setMarker(currentUserLocation);
    // get address branch
    setServiceAddress(currentUserLocation);
    // stop loading
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) => setLoadingOpenServiceMap(false),
    );
  }

  // on click on service map
  clickOnServicesMap({
    required LatLng position,
  }) {
    // set marker
    setMarker(position);
    // get address branch
    setServiceAddress(position);
  }

  // get location place
  getLocationPlace(Predictions place) async {
    GoogleMapsPlaces plist = GoogleMapsPlaces(
      apiKey: "AIzaSyDrYGO6_f5w82uKqeGda8UPQm9tQ52cD7c",
    );
    String placeid = place.placeId ?? "0";
    final detail = await plist.getDetailsByPlaceId(placeid);
    final geometry = detail.result.geometry!;
    final latitude = geometry.location.lat;
    final longitude = geometry.location.lng;
    // set new location
    clickOnServicesMap(
      position: LatLng(latitude, longitude),
    );
    // move camera to map
    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        // on below line we have given positions of Location 5
        CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: zoomMap,
        ),
      ),
    );
  }

  // get list places search
  Future<List<Predictions>> getListPlacesSearch({
    String? searchText,
  }) async {
    try {
      // set request
      dynamic responseResult = await ApiHelper.apiHelper.searchPlaceFromApi(
        placeName: searchText ?? '',
      );
      // change respose from json to dart
      PlaceAutoCompleteResponse placeAutoCompleteResponse =
          PlaceAutoCompleteResponse.fromJson(responseResult);
      if (placeAutoCompleteResponse.predictions != null) {
        // return list places search
        return placeAutoCompleteResponse.predictions ?? [];
      } else {
        // return empty list places search
        return [];
      }
    } on Exception catch (e) {
      // print faild message
      UiHelper.uiHelper.showMessage(message: e.toString());
      // return empty list places search
      return [];
    }
  }
}
