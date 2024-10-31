import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
  });

  final String image;
  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            height: Get.height * .1 * 1.9,
            width: Get.width * .4,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, left: 7, bottom: 3),
                    child: Text(name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          right: 10,
          top: 10,
        ),
      ],
    );
  }
}
