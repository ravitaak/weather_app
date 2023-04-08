import 'package:get/get.dart';

import '../models/weathers/current_weather.dart';

class WeatherController extends GetxController {
  final currentWeatherData = Rxn<CurrentWeatherData>();
  RxString cityName = RxString("");
  RxBool loaded = RxBool(false);
  RxBool loading = RxBool(false);
}
