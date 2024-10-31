import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/models/products_model.dart';
import 'package:new_api_project/screens/home_screen/home_screen_controller.dart';
import 'package:new_api_project/widgets/app_cache_image.dart';
import 'package:new_api_project/widgets/image_viewer.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'E-Commerce App',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        body: GetBuilder<HomeScreenController>(builder: (context) {
          return Column(
            children: [
              /*Expanded(
                child: ListView(
                  children: [
                    _buildCategorySection('Jewelery', controller.jeweleryList),
                    _buildCategorySection(
                        'Men\'s Clothing', controller.mensClothingList)
                  ],
                ),
              ),*/
              Expanded(
                child: ListView.builder(
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) {
                    if (controller.productsList.isEmpty) {
                      print('^^^^^^^^^^^^^^^^^^^^^^^^^^^');
                      return const Expanded(
                          child: Center(
                        child: CircularProgressIndicator(),
                      ));
                    } else {
                      final products = controller.productsList[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 5),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => ImageViewer(
                                        imageUrl: products.image.toString()));
                                  },
                                  child: AppCacheImage(
                                    imageUrl: products.image.toString(),
                                    height: Get.height * .1 * 1.6,
                                    width: Get.width * .1 * 2.2,
                                  ),
                                )),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: 'Title\n',
                                          children: [
                                            TextSpan(
                                              text: products.title.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            )
                                          ],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: 'Description\n',
                                          children: [
                                            TextSpan(
                                              text: products.description
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            )
                                          ],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: 'Price\n',
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${products.price.toString()}\$',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            )
                                          ],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget _buildCategorySection(String title, List<ProductsModel> products) {
  return ExpansionTile(
    title: Text(title),
    children: products.map((product) {
      return ListTile(
        title: Text(product.id.toString()),
        subtitle: Text('\$${product.price}'),
        leading: Image.network(product.image.toString()),
      );
    }).toList(),
  );
}
