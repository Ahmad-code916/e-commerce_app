import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/electronics/electronics_screen.dart';
import 'package:new_api_project/screens/jewelery_screen/jewelery_screen.dart';
import 'package:new_api_project/screens/mens_clothing_screen/mens_clothing_screen.dart';
import 'package:new_api_project/screens/view_all_categories_screen/view_all_categories_screen.dart';
import 'package:new_api_project/screens/women_clothing_screen/women_clothing_screen.dart';

class ScreenTwoController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  late List<String> categories = [];

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
   void goToViewAllCategoriesScreen() {
    Get.to(() => ViewAllCategoriesScreen());
  }
}
