import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/home_screen/home_screen.dart';
import 'package:new_api_project/screens/screen_one/screen_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenOne(),
    );
  }
}
