import 'package:flutter/material.dart';

import 'mainpage/current_other_details.dart';
import 'mainpage/cuurent_weather_main.dart';
import 'mainpage/navbar.dart';
import 'mainpage/next_days.dart';
import 'mainpage/today_hourly.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 28, 30, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NavBar(),
              MainCurrentWeather(),
              CurrentOtherDetails(),
              // Today
              TodayHourly(),
              // Next 5 Days
              NextDays(),
            ],
          ),
        ),
      ),
    );
  }
}
