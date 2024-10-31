import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/screen_one/screen_one_controller.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  final ScreenOneController controller = Get.put(ScreenOneController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/boy_image.jpg')),
            const SizedBox(height: 50),
            const Text(
              'Explore Fashion\nCategories',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enjoy a hassel free shopping experience\nwith secure payment options and quick\ndeliver.Shop confidently',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                controller.goToScreenTwo();
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 10, bottom: 10),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                decoration: BoxDecoration(
                    color: Color(0xFF10CCCCC),
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
