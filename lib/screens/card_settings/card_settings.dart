import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:new_api_project/screens/card_settings/card_settings_controller.dart';

class CardSettings extends StatelessWidget {
  CardSettings({super.key});

  final CardSettingController controller = Get.put(CardSettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 17),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                'Payment Settings',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Expanded(
                        //     child: Column(
                        //       children: [
                        //         if (controller.isLoading)
                        //           const Expanded(child: NativeProgress())
                        //         else
                        //           ...List.generate(controller.cardsList.length + 1,
                        //                   (i) {
                        //                 if (controller.cardsList.length == i) {
                        //                   return GestureDetector(
                        //                     behavior: HitTestBehavior.opaque,
                        //                     onTap: () {
                        //                       controller.addNewCard();
                        //                     },
                        //                     child: Row(
                        //                       children: [
                        //                         Container(
                        //                           padding: const EdgeInsets.symmetric(
                        //                               horizontal: 4, vertical: 2),
                        //                           decoration: BoxDecoration(
                        //                               color: AppColors.lightGreySixth,
                        //                               borderRadius:
                        //                               BorderRadius.circular(5)),
                        //                           child: const Icon(Icons.add),
                        //                         ),
                        //                         const SizedBox(width: 10),
                        //                         Text(
                        //                           AppStrings.addCard.tr,
                        //                           style: const TextStyle(
                        //                               fontSize: 15,
                        //                               fontFamily: 'inter',
                        //                               fontWeight: FontWeight.w400),
                        //                         )
                        //                       ],
                        //                     ),
                        //                   );
                        //                 }
                        //                 return GestureDetector(
                        //                   onTap: () {
                        //                     controller.defaultPaymentMethodId =
                        //                     controller.cardsList[i]['id'];
                        //                     controller.update();
                        //                   },
                        //                   child: Container(
                        //                     width: double.infinity,
                        //                     margin: const EdgeInsets.only(bottom: 10),
                        //                     padding: const EdgeInsets.all(10),
                        //                     decoration: BoxDecoration(
                        //                         color: AppColors.white,
                        //                         borderRadius: BorderRadius.circular(8),
                        //                         border: Border.all(
                        //                             color: AppColors.lightGreySixth)),
                        //                     child: Row(
                        //                       mainAxisAlignment:
                        //                       MainAxisAlignment.spaceBetween,
                        //                       children: [
                        //                         Text(
                        //                             '${controller.cardsList[i]['brandName']} **** **** **** ${controller.cardsList[i]['last4digits']}',
                        //                             style: const TextStyle(
                        //                                 fontSize: 15,
                        //                                 fontFamily: 'inter',
                        //                                 fontWeight: FontWeight.w400)),
                        //                         Container(
                        //                           height: 20,
                        //                           width: 20,
                        //                           decoration: BoxDecoration(
                        //                             border: Border.all(
                        //                                 color: AppColors.darkGreen),
                        //                             borderRadius:
                        //                             BorderRadius.circular(49),
                        //                           ),
                        //                           child: Padding(
                        //                             padding: const EdgeInsets.all(5.0),
                        //                             child: Container(
                        //                               decoration: BoxDecoration(
                        //                                 shape: BoxShape.circle,
                        //                                 color: controller.cardsList[i]
                        //                                 ['id'] ==
                        //                                     controller
                        //                                         .defaultPaymentMethodId
                        //                                     ? AppColors.darkGreen
                        //                                     : Colors.transparent,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 );
                        //               })
                        //       ],
                        //     )),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      margin: const EdgeInsets.only(right: 20, bottom: 30),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}
