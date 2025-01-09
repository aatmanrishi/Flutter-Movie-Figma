import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviefigma/Controller/mainController.dart';
import 'package:moviefigma/UI/Pages/SplashScreen.dart';


void main() {
  Get.put(MainController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Movie Figam',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        
        home: SplashScreen());
  }
}
