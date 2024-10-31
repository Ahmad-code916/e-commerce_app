import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:new_api_project/screens/item_view_screen/item_view_screen.dart';
import '../../models/products_model.dart';
import 'package:http/http.dart' as http;

class MensClothingScreenController extends GetxController {
  final List<ProductsModel> mensClothingList = [];

  Future<List<ProductsModel>> getMenProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          ProductsModel productsModel = ProductsModel.fromJson(i);
          if (productsModel.category == 'men\'s clothing') {
            mensClothingList.add(productsModel);
            update();
          }
        }
        return mensClothingList;
      } else {
        throw Exception('Status Code Error');
      }
    } on SocketException {
      throw Exception('No Internet');
    }
  }

  @override
  void onInit() {
    getMenProducts();
    super.onInit();
  }

  void goBack() {
    Get.back();
  }

  void goToItemViewScreen(String image, String title, String price,
      String rating, String count, String description) {
    Get.to(() => ItemViewScreen(
          image: image,
          title: title,
          price: price,
          rating: rating,
          count: count,
          description: description,
        ));
  }
}
