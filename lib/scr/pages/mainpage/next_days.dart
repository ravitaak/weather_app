import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/weather_controller.dart';

class NextDays extends StatelessWidget {
  const NextDays({
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
              Text("Next Few Days",
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 18,
                  )),
            ],
          ),
        ),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: weatherContr.currentWeatherData.value!.daily.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                            getDay(weatherContr
                                .currentWeatherData.value!.daily[index].dt),
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                      Text(
                          "${(weatherContr.currentWeatherData.value!.daily[index].temp.day - 273.15).toStringAsFixed(0)}°",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      Container(
                          height: 5,
                          width: (weatherContr.currentWeatherData.value!
                                          .daily[index].temp.day -
                                      270) /
                                  2 +
                              25,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromRGBO(11, 179, 228, 1),
                                  Color.fromRGBO(24, 202, 196, 1),
                                  Color.fromRGBO(60, 226, 159, 1),
                                ],
                              ))),
                      SizedBox(
                        width: 25,
                        child: Image(
                            image: AssetImage(
                                "assets/icons/${weatherContr.currentWeatherData.value!.daily[index].weather.icon}.png")),
                      ),
                    ],
                  ),
                );
              },
            ))
      ],
    );
  }
}

String getDay(final tineStamp) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(tineStamp * 1000);
  String x = DateFormat("EEEE").format(time);
  return x;
}
