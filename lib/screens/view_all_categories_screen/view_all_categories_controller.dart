import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../electronics/electronics_screen.dart';
import '../jewelery_screen/jewelery_screen.dart';
import '../mens_clothing_screen/mens_clothing_screen.dart';
import '../women_clothing_screen/women_clothing_screen.dart';
import 'package:http/http.dart' as http;

class ViewAllCategoriesController extends GetxController {
  void goToJeweleryScreen(String name) {
    Get.to(() => JeweleryScreen(name: name));
  }

  void goToMenClothingScreen(String name) {
    Get.to(() => MensClothingScreen(name: name));
  }

  void goToWomenClothingScreen(String name) {
    Get.to(() => WomensClothingScreen(name: name));
  }

  void goToElectronicScreen(String name) {
    Get.to(() => ElectronicScreen(name: name));
  }

  void goBack() {
    Get.back();
  }
}
