import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:new_api_project/utilities/stripe_api_keys.dart';
import 'package:http/http.dart' as http;

class StripeServices {
  StripeServices._();

  Map<String, dynamic>? paymentIntent;
  static final StripeServices instance = StripeServices._();

  makePayment(String amount) async {
    try {
      // String? paymentIntentClientSecret =
      //     await createPaymentIntent(amount, 'usd');
      // if (paymentIntentClientSecret == null) return;
      paymentIntent = await createPaymentIntent(amount, 'usd');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              merchantDisplayName: 'Ahmad'));
      await _processPayment();
    } catch (e) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: e.toString());
    }
  }

  // Future<String?> createPaymentIntent(String amount, String currency) async {
  //   try {
  //     final Dio dio = Dio();
  //     Map<String, dynamic> data = {
  //       "amount": _calculatedAmount(amount),
  //       "currency": currency,
  //     };
  //     final response = await dio.post(
  //         "https://api.stripe.com/v1/payment_intents",
  //         data: data,
  //         options:
  //             Options(contentType: Headers.formUrlEncodedContentType, headers: {
  //           "Authorization": "Bearer $secretKey",
  //           "content-Type": "application/x-www-form-urlencoded",
  //         }));
  //     if (response.data != null) {
  //       return response.data['client_secret'];
  //     }
  //     return null;
  //   } catch (e) {
  //     showOkAlertDialog(
  //         context: Get.context!, title: 'Error', message: e.toString());
  //   }
  //   return null;
  // }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "amount": _calculatedAmount(amount),
        "currency": currency,
      };
      final response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization": "Bearer  $secretKey",
            "content-Type": "application/x-www-form-urlencoded",
          });

      return jsonDecode(response.body.toString());
    } catch (e) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: e.toString());
    }
    return null;
  }

  String _calculatedAmount(String amount) {
    final calculateAmount = int.parse(amount.toString()) * 100;
    return calculateAmount.toString();
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'Transaction Failed');
    }
  }
}
