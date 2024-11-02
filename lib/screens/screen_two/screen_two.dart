import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/card_settings/card_settings.dart';
import 'package:new_api_project/screens/cart_list_screen/cart_list_screen.dart';
import 'package:new_api_project/screens/screen_two/screen_two_controller.dart';
import 'package:new_api_project/widgets/container_widget.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({super.key});

  final ScreenTwoController controller = Get.put(ScreenTwoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ScreenTwoController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color(0xFFFFE6E6),
                      Colors.white38,
                      Color(0xFFFFE6E6)
                    ])),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => CardSettings());
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/boy_image.jpg'),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                              Text(
                                'Let\'s shop!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 18),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            size: 30,
                            Icons.favorite,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => CartListScreen());
                            },
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: controller.searchController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search Category',
                          hintStyle: TextStyle(color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Collection',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        const Text(
                          'Discount 50% for\nthe first transaction',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 30),
                            decoration: BoxDecoration(
                                color: const Color(0xFF10CCCCC),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/image_girl.jpg',
                      width: Get.width * .4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shop by Category',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.goToViewAllCategoriesScreen();
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
                        controller.goToElectronicScreen('electronics');
                      },
                      image: 'assets/images/electronic.jpg',
                      name: 'electronics',
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    ));
  }
}
