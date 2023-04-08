import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/weather_controller.dart';

class MainCurrentWeather extends StatelessWidget {
  const MainCurrentWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherContr = Get.find<WeatherController>();
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${(weatherContr.currentWeatherData.value!.temp - 273.15).toStringAsFixed(0)}°",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 90,
                        fontWeight: FontWeight.w600)),
                Text(
                    weatherContr.currentWeatherData.value!.weather.description
                        .toUpperCase(),
                    style: GoogleFonts.ptSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 1,
                      fontSize: 18,
                    )),
              ],
            ),
            SizedBox(
              height: 120,
              child: Image(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                    "assets/icons/${weatherContr.currentWeatherData.value!.weather.icon}.png"),
              ),
            )
          ],
        ));
  }
}
