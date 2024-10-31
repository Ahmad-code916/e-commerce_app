import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_cache_image.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          InteractiveViewer(
            child: ClipRRect(
              child: AppCacheImage(
                imageUrl: imageUrl,
                width: Get.width,
                height: Get.height * 1,
                round: 0,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ]),
      ),
    );
  }
}
