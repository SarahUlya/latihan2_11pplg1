import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  var isLoading = false.obs;

  Future<void> startPayment() async {
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/snap'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "amount": 10000
        }),
      );

      final data = jsonDecode(response.body);
      final snapToken = data['snap_token'];

      Get.toNamed('/midtrans', arguments: snapToken);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
