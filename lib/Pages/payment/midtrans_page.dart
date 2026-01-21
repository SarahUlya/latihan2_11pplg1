import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MidtransPage extends StatefulWidget {
  final String snapToken;

  const MidtransPage({super.key, required this.snapToken});

  @override
  State<MidtransPage> createState() => _MidtransPageState();
}

class _MidtransPageState extends State<MidtransPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..addJavaScriptChannel(
    'PaymentStatus',
    onMessageReceived: (message) {
      final status = message.message;
      if (status == 'success') {
        Get.snackbar('Sukses', 'Pembayaran berhasil');
        Get.back();
      } else if (status == 'pending') {
        Get.snackbar('Pending', 'Menunggu pembayaran');
      } else {
        Get.snackbar('Gagal', 'Pembayaran dibatalkan');
      }
    },
  )
  ..loadRequest(
    Uri.parse(
      'https://app.sandbox.midtrans.com/snap/v2/vtweb/${widget.snapToken}',
    ),
  );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Midtrans Payment')),
      body: WebViewWidget(controller: controller),
    );
  }
}
