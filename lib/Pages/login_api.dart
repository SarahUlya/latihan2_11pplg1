import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/login_api_controller.dart';
import 'package:latihan2_11pplg1/Widgets/widget_button.dart';
import 'package:latihan2_11pplg1/Widgets/widget_textfield.dart';

class LoginApiPage extends StatelessWidget {
  LoginApiPage({super.key});
  final controller = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page"), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          margin: const EdgeInsets.only(top: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customTextField(
                    textEditingController: controller.userController,
                    labelText: "Username",
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customTextField(
                    textEditingController: controller.passwordController,
                    labelText: "Password",
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: "Login",
                    textColor: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      if (!controller.isLoading.value) {
                        controller.LoginApi();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Image.network(
                      'https://www.citypng.com/public/uploads/preview/google-logo-icon-gsuite-hd-701751694791470gzbayltphh.png',
                      height: 24,
                    ),

                    label: const Text(
                      "Sign in with Google",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      controller.loginWithGoogle();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
