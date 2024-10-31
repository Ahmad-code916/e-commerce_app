import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/view_all_categories_screen/view_all_categories_controller.dart';

import '../../widgets/container_widget.dart';

class ViewAllCategoriesScreen extends StatelessWidget {
  ViewAllCategoriesScreen({super.key});

  final ViewAllCategoriesController controller =
      Get.put(ViewAllCategoriesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFFFFE6E6),
              Colors.white38,
              Color(0xFFFFE6E6)
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    controller.goBack();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'See all categories here : ',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 30,
                runSpacing: 10,
                children: [
                  ContainerWidget(
                    onTap: () {
                      controller.goToJeweleryScreen('Jewelery');
                    },
                    image: 'assets/images/ring.jpg',
                    name: 'Jewelery',
                  ),
                  ContainerWidget(
                    onTap: () {
                      controller.goToMenClothingScreen('Men\'s Clothing');
                    },
                    image: 'assets/images/men_shirt.jpg',
                    name: 'Men\'s Clothing',
                  ),
                  ContainerWidget(
                    onTap: () {
                      controller.goToWomenClothingScreen('Women\'s Clothing');
                    },
                    image: 'assets/images/girl_cloth.jpg',
                    name: 'Women\'s Clothing',
                  ),
                  ContainerWidget(
                    onTap: () {
                      controller.goToElectronicScreen('Electronics');
                    },
                    image: 'assets/images/electronic.jpg',
                    name: 'Electronics',
                  ),
                  ContainerWidget(
                    onTap: () {
                      controller.goToElectronicScreen('Electronics');
                    },
                    image: 'assets/images/electronic.jpg',
                    name: 'Electronics',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
