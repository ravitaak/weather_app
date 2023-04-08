import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/scr/pages/homepage.dart';

import 'scr/controller/home_binding.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
