import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/home_controller.dart';
import 'package:latihan2_11pplg1/Pages/login_page.dart';
import 'package:latihan2_11pplg1/Pages/splash_screen.dart';
import 'package:latihan2_11pplg1/Widgets/widget_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.username.value.isNotEmpty
                      ? 'Hello ${controller.username.value}'
                      : 'Loading...',
                  style: const TextStyle(fontSize: 26),
                )),
            const SizedBox(height: 20),
            CustomButton(
              text: "Logout",
              textColor: const Color.fromARGB(255, 0, 0, 0),
              onPressed: () async {
                await controller.removeUser();
                Get.offAll(() => SplashScreenPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
