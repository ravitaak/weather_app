import 'package:get/get.dart';
import 'package:weather_app/scr/controller/weather_controller.dart';

import '../utils/permissions.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController());
    getUserCurrentWeatherDetails();
  }
}
