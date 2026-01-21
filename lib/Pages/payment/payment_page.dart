import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan2_11pplg1/config/api_config.dart';
import 'midtrans_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  Future<void> startPayment() async {
    try {
      debugPrint('➡️ BELI DIPENCET');

      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/api/snap'),
        headers: {
          'Accept': 'application/json',
        },
      );

      debugPrint('📩 STATUS: ${response.statusCode}');
      debugPrint('📩 BODY: ${response.body}');

      if (response.statusCode != 200) {
        Get.snackbar('Error', 'Server error');
        return;
      }

      final data = jsonDecode(response.body);

      if (!data.containsKey('snap_token')) {
        Get.snackbar('Error', 'Snap token tidak ada');
        return;
      }

      final snapToken = data['snap_token'];

      Get.to(() => MidtransPage(snapToken: snapToken));
    } catch (e) {
      Get.snackbar('Error', e.toString());
      debugPrint('❌ ERROR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: startPayment,
          child: const Text('BELI'),
        ),
      ),
    );
  }
}
