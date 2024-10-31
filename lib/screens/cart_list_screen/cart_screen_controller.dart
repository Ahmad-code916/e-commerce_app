import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_api_project/models/cart_model.dart';
import 'package:http/http.dart' as http;

class CartListScreenController extends GetxController {
  final List<CartModel> cartList2 = [];

  Future<List<CartModel>> getCartList() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/carts?userId=1'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        cartList2.add(CartModel.fromJson(i));
        update();
      }
    } else {
      throw Exception('Status Code error');
    }
    return cartList2;
  }

  @override
  void onInit() {
    getCartList();
    super.onInit();
  }
}
