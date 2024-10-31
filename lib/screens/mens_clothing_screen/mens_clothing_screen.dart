import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/jewelery_screen/jewelery_screen_controller.dart';
import 'package:new_api_project/screens/mens_clothing_screen/mens_clothing_controller.dart';
import 'package:new_api_project/widgets/app_cache_image.dart';
import 'package:new_api_project/widgets/rich_text_widget.dart';

class MensClothingScreen extends StatelessWidget {
  MensClothingScreen({super.key, required this.name});

  final String name;
  final MensClothingScreenController controller =
      Get.put(MensClothingScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: GetBuilder<MensClothingScreenController>(builder: (context) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  // Color(0xFFFF99CC),
                  Color(0xFFFFE6E6),
                  Colors.white38,
                  Color(0xFFFFE6E6)
                ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.goBack();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  const Icon(Icons.search, size: 30),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (controller.mensClothingList.isEmpty)
            const Expanded(
                child: Center(
              child: CircularProgressIndicator(),
            ))
          else
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      // Color(0xFFFF99CC),
                      Color(0xFFFFE6E6),
                      Colors.white38,
                      Color(0xFFFFE6E6)
                    ])),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: controller.mensClothingList.length,
                  itemBuilder: (context, index) {
                    final data = controller.mensClothingList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.goToItemViewScreen(
                            data.image.toString(),
                            data.title.toString(),
                            data.price.toString(),
                            data.rating!.rate.toString(),
                            data.rating!.count.toString(),
                            data.description.toString());
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppCacheImage(
                                imageUrl: data.image.toString(),
                                width: Get.width * .5,
                                height: Get.height * .1 * 1.9),
                            const SizedBox(height: 5),
                            RichTextWidget(
                                name: 'Title', value: data.title.toString()),
                            RichTextWidget(
                                name: 'Price', value: data.price.toString()),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.orangeAccent,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(data.rating!.rate.toString()),
                                  const SizedBox(width: 5),
                                  Text(
                                      '(${data.rating!.count.toString()} Reviews)')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
        ],
      );
    })));
  }
}
