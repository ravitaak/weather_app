import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/weather_controller.dart';

class TodayHourly extends StatelessWidget {
  const TodayHourly({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherContr = Get.find<WeatherController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            children: [
              Text("Today",
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 18,
                  )),
            ],
          ),
        ),
        Obx(() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      weatherContr.currentWeatherData.value!.hourly.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(32, 35, 41, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              getDate(weatherContr
                                  .currentWeatherData.value!.hourly[index].dt),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              )),
                          Text(
                              getTime(weatherContr
                                  .currentWeatherData.value!.hourly[index].dt),
                              style: GoogleFonts.nunito(
                                color: Colors.grey,
                                fontSize: 14,
                              )),
                          SizedBox(
                            height: 25,
                            child: Image(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                  "assets/icons/${weatherContr.currentWeatherData.value!.hourly[index].weather.icon}.png"),
                            ),
                          ),
                          Text(
                              "${(weatherContr.currentWeatherData.value!.hourly[index].temp - 273.15).toStringAsFixed(0)}°",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )),
      ],
    );
  }
}

String getTime(final tineStamp) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(tineStamp * 1000);
  String x = DateFormat("hh:mm aaa").format(time);
  return x;
}

String getDate(final tineStamp) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(tineStamp * 1000);
  String x = DateFormat("dd MMM").format(time);
  return x;
}
