import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:moviefigma/Controller/mainController.dart';
import 'package:moviefigma/UI/Pages/MainScreen.dart';

class SplashScreen extends StatelessWidget {
  final mainController = Get.find<MainController>();

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Get.to(() => const MainScreen(),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(milliseconds: 500));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset('assets/images/Group 23.png')),
    );
  }
}
