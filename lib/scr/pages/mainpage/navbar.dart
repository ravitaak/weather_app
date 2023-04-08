import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/weather_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherContr = Get.find<WeatherController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(weatherContr.cityName.value,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600))),
              const SizedBox(height: 5),
              Text(DateFormat("dd MMMM , EEEE").format(DateTime.now()),
                  style: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 16,
                  )),
            ],
          ),
          Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(32, 35, 41, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )),
              child: const Icon(
                color: Colors.white,
                size: 30,
                Icons.dashboard_sharp,
              )),
        ],
      ),
    );
  }
}
