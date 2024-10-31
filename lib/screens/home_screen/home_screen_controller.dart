import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:new_api_project/models/products_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  final List<ProductsModel> productsList = [];
  final List<ProductsModel> jeweleryList = [];
  final List<ProductsModel> mensClothingList = [];

   Future<List<ProductsModel>> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          productsList.add(ProductsModel.fromJson(i));
          update();
        }
        return productsList;
      } else {
        throw Exception('Status Code Error');
      }
    } on SocketException {
      throw Exception('No Internet');
    }
  }
 /* Future<List<ProductsModel>> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          ProductsModel productsModel = ProductsModel.fromJson(i);
          // switch (productsModel.category) {
          //   case 'jewelery':
          //     jeweleryList.add(productsModel);
          //     break;
          //   // case 'men\'s clothing':
          //   //   jeweleryList.add(productsModel);
          //   //   break;
          // }
          if (productsModel.category == 'jewelery') {
            jeweleryList.add(productsModel);
            update();
          }
          if (productsModel.category == 'men\'s clothing') {
            mensClothingList.add(productsModel);
            update();
          }
          update();
        }
        return jeweleryList;
      } else {
        throw Exception('Status Code Error');
      }
    } on SocketException {
      throw Exception('No Internet');
    }
  }*/

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
