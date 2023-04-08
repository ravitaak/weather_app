import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../controller/weather_controller.dart';
import 'mainpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherContr = Get.find<WeatherController>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 12, 30, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SimpleShadow(
                opacity: 0.7,
                color: Colors.orange,
                offset: const Offset(-70, 0),
                sigma: 60,
                child: Image.asset("assets/images/logo.png"),
              ),
              SimpleShadow(
                opacity: 0.7,
                color: Colors.blue,
                offset: const Offset(70, 0),
                sigma: 60,
                child: Image.asset("assets/images/logo.png"),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 70.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Discover the Weather in Your City",
                  style: GoogleFonts.actor(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 1.8,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Get to know your weather maps and radar precipitation forecast.",
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Obx(() => CupertinoButton(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue,
                      ),
                      child: weatherContr.loading.value
                          ? const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("Get Started",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
                onPressed: () {
                  if (weatherContr.loaded.value) {
                    Get.to(() => const MainPage());
                  } else {
                    weatherContr.loading.value = true;
                  }
                },
              )),
        ],
      ),
    );
  }
}
