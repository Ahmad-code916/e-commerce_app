import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utilities/stripe_api_keys.dart';

class CardSettingController extends GetxController {
  Future<List<dynamic>?> getCardList(String customerId) async {
    try {
      final Dio dio = Dio();
      final response = await dio.get('https://api.stripe.com/v1/customers',
          queryParameters: {'customer': customerId, 'Type': 'card'},
          options: Options(headers: {
            'Authorization': 'Bearer $secretKey',
          }));
      if (response.data == 200) {
        return response.data['data'];
      }
    } catch (e) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: e.toString());
    }
    return null;
  }
  // static Future<List<dynamic>> getCardList(String customerId) async {
  //   try {
  //     var response = await GetConnect()
  //         .get('$BASE_URL/customer-cards', query: {'customerId': customerId});
  //     if (response.isOk) {
  //       return (response.body ?? []) as List<dynamic>;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return [];
  // }

}
