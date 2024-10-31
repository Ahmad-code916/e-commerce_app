import 'dart:convert';
import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:get/get.dart';
import '../../models/products_model.dart';
import 'package:http/http.dart' as http;

class JeweleryScreenController extends GetxController {
  final List<ProductsModel> jeweleryList = [];
  final List<ProductsModel> cartList = [];

  Future<List<ProductsModel>> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          ProductsModel productsModel = ProductsModel.fromJson(i);
          if (productsModel.category == 'jewelery') {
            jeweleryList.add(productsModel);
            update();
          }
        }
        return jeweleryList;
      } else {
        throw Exception('Status Code Error');
      }
    } on SocketException {
      throw Exception('No Internet');
    }
  }

  void addToCart(int index) {
    try {
      final listNew = jeweleryList[index];
      if (cartList.contains(listNew)) {
        showOkAlertDialog(
            context: Get.context!,
            title: 'Added',
            message: 'Already added to cart list');
      } else {
        cartList.add(listNew);
        update();
        Get.snackbar('Added', 'Added');
      }
    } catch (e) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'No added');
    }
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void goBack() {
    Get.back();
  }
}
