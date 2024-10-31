import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/cart_list_screen/cart_screen_controller.dart';
import 'package:new_api_project/screens/jewelery_screen/jewelery_screen_controller.dart';
import 'package:new_api_project/widgets/cart_list_controller.dart';
import '../../widgets/app_cache_image.dart';

class CartListScreen extends StatelessWidget {
  CartListScreen({super.key});

  final JeweleryScreenController controller =
      Get.put(JeweleryScreenController(), permanent: true);
  final CartListScreenController controller2 =
      Get.put(CartListScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: GetBuilder<CartListScreenController>(builder: (context) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
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
                    const Text(
                      'Cart',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    const Icon(Icons.search, size: 30),
                    // const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: controller2.cartList2.length,
                  itemBuilder: (context, index) {
                    final data = controller2.cartList2[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichTextReuse(
                              name: 'Id : ', value: data.id.toString()),
                          RichTextReuse(
                              name: 'User Id : ',
                              value: data.userId.toString()),
                          ...data.products!.map(
                            (products) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichTextReuse(
                                      name: 'Product Quantity : ',
                                      value: products.quantity.toString()),
                                  RichTextReuse(
                                      name: 'Product Id : ',
                                      value: products.productId.toString())
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      }),
    ));
  }
}

class RichTextReuse extends StatelessWidget {
  const RichTextReuse({super.key, required this.name, required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      TextSpan(
        text: name,
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          )
        ],
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}
