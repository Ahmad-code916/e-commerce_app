import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_api_project/screens/item_view_screen/item_view_controller.dart';
import 'package:new_api_project/screens/screen_two/screen_two.dart';
import 'package:new_api_project/services/stripe_services.dart';

class ItemViewScreen extends StatelessWidget {
  ItemViewScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.count,
    required this.description,
  });

  final String image;
  final String title;
  final String price;
  final String rating;
  final String count;
  final String description;

  final ItemViewController controller = Get.put(ItemViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                    onTap: () {
                      controller.goBack();
                    },
                    child: const Icon(Icons.arrow_back_ios)),
              ),
              Stack(
                children: [
                  ClipRRect(
                      child: Image.network(
                    image,
                    height: Get.height * .5,
                    width: Get.width,
                  )),
                  Container(
                    margin: const EdgeInsets.only(top: 300),
                    width: Get.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$price\$',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
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
                                Text.rich(
                                  overflow: TextOverflow.ellipsis,
                                  TextSpan(
                                    text: rating,
                                    children: [
                                      TextSpan(
                                        text: '($count Reviews)',
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              text: 'Description : \n',
                              children: [
                                TextSpan(
                                  text: description,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    StripeServices.instance.makePayment(10);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.tealAccent,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: const Text(
                                      'Buy',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
