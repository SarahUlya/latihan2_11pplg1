import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Components/custom_button.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Components/text_field.dart';

class LoginPage1 extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color.fromARGB(255, 80, 146, 201),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: usernameController,
              label: "Username",
              icon: Icons.person,
            ),

            const SizedBox(height: 16),

            CustomTextField(
              controller: passwordController,
              label: "Password",
              obscure: true,
              icon: Icons.lock,
            ),

            const SizedBox(height: 20),

            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: CustomButton(
                  text: "Login",
                  isLoading: authController.isLoading.value,
                  onPressed: () {
                    authController.login(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
