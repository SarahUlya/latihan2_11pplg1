import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';

class HomePage1 extends StatelessWidget {
  HomePage1({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 146, 201),
        title: const Text('Home'),
      ),

      body: Center(
        child: Obx(() {
          return Text(
            authController.username.value.isNotEmpty
                ? "Hello, ${authController.username.value} 👋😆"
                : "Loading...",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          );
        }),
      ),
    );
  }
}
