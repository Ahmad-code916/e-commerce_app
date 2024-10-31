import 'package:get/get.dart';
import 'package:new_api_project/screens/home_screen/home_screen.dart';
import 'package:new_api_project/screens/screen_two/screen_two.dart';

class ScreenOneController extends GetxController {
  void goToScreenTwo() {
    Get.offAll(() => ScreenTwo());
  }
}
