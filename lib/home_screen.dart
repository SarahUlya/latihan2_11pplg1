import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/notification_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final NotificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Push Notification Demo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Obx(
            //   () => Text(
            //     'FCM Token:\n${controller.fcmToken.value}',
            //     style: TextStyle(fontSize: 12),
            //   ),
            // ),
            // SizedBox(height: 20),
            Obx(
              () => Text(
                controller.title.value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(
                controller.body.value,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
