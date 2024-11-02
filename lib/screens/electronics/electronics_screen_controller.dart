import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import '../../models/products_model.dart';
import 'package:http/http.dart' as http;

class ElectronicsScreenController extends GetxController {
  final List<ProductsModel> electronicsList = [];

  Future<List<ProductsModel>> getElectronicsProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          ProductsModel productsModel = ProductsModel.fromJson(i);
          if (productsModel.category == 'electronics') {
            electronicsList.add(productsModel);
            update();
          }
        }
        return electronicsList;
      } else {
        throw Exception('Status Code Error');
      }
    } on SocketException {
      throw Exception('No Internet');
    }
  }

  @override
  void onInit() {
    getElectronicsProducts();
    super.onInit();
  }

  void goBack() {
    Get.back();
  }
}
