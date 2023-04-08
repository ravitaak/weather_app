import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/weather_controller.dart';
import '../models/weathers/current_weather.dart';
import '../pages/mainpage.dart';

String baseUrl = 'api.openweathermap.org';
String baseUrl1 = 'api.openweathermap.org';
String apiKey = '559e2fbe4b379f63cc260277c2206826';

class ApiRepository {
  static var weatherContr = Get.find<WeatherController>();
  static Future getWeatherDataByLanLon(String lat, String lon) async {
    try {
      final queryParameters = {
        'lat': lat,
        'lon': lon,
        'apiKey': apiKey,
      };
      final url = Uri.https(baseUrl, '/data/3.0/onecall', queryParameters);
      final url1 = Uri.https(baseUrl, '/data/2.5/weather', queryParameters);

      var response = await http.get(url);
      var response1 = await http.get(url1);
      var data = CurrentWeatherData.fromJson(response.body);
      weatherContr.currentWeatherData.value = data;
      weatherContr.cityName.value = jsonDecode(response1.body)['name'];
      Future.delayed(const Duration(seconds: 0), () {
        Get.to(() => const MainPage());
      });
      weatherContr.loading.value = false;
      weatherContr.loaded.value = true;
      weatherContr.loaded.refresh();
      weatherContr.loading.refresh();
    } catch (e) {
      debugPrint(e.toString());
      weatherContr.loading.value = false;
    }
  }
}
