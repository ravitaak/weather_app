// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:location/location.dart';

import '../api/api_repository.dart';
import '../controller/weather_controller.dart';

var weatherContr = Get.find<WeatherController>();
Future requestPermissions() async {
  try {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  } on Exception {
    Get.showSnackbar(const GetSnackBar(
      title: "No Location",
      message:
          "Please give the location permission, so we can so weather details",
      snackPosition: SnackPosition.BOTTOM,
    ));
  }
}

Future requestLocation() async {
  Location location = Location();
  LocationData locationData;
  locationData = await location.getLocation();
  return locationData;
}

getUserCurrentWeatherDetails() async {
  if (await requestPermissions()) {
    LocationData locationData = await requestLocation();
    if (locationData.latitude != null) {
      ApiRepository.getWeatherDataByLanLon(
          locationData.latitude.toString(), locationData.longitude.toString());
    } else {
      ApiRepository.getWeatherDataByLanLon("26.912434", "75.787270");
    }
  } else {
    Get.showSnackbar(const GetSnackBar(
      title: "No Location",
      message:
          "Please give the location permission, so we can so weather details",
      snackPosition: SnackPosition.BOTTOM,
    ));
  }
}
