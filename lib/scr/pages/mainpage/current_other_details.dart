import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/weather_controller.dart';

class CurrentOtherDetails extends StatelessWidget {
  const CurrentOtherDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherContr = Get.find<WeatherController>();
    return Container(
      margin: const EdgeInsets.all(25),
      height: 100,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(32, 35, 41, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
      child: Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("💨",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      )),
                  const SizedBox(height: 5),
                  Text(
                      "${(weatherContr.currentWeatherData.value!.wind_speed * 3.6).toStringAsFixed(1)} k/h",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  Text("Wind",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("💦",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      )),
                  const SizedBox(height: 5),
                  Text("${weatherContr.currentWeatherData.value!.humidity}%",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  Text("Humidity",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("👀",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                      )),
                  const SizedBox(height: 5),
                  Text(
                      "${(weatherContr.currentWeatherData.value!.visibility / 1000).toStringAsFixed(1)} km",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  Text("Visibility",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
