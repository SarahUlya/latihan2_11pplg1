// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:latihan2_11pplg1/Pages/home_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController userController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         title: Text('Login Page'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: userController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter User',
//                     contentPadding: const EdgeInsets.all(10.0),
//                     hintStyle: TextStyle(
//                       color: Colors.blueGrey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter Password',
//                     contentPadding: const EdgeInsets.all(10.0),
//                     hintStyle: TextStyle(
//                       color: Colors.blueGrey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               MaterialButton(
//                 color: const Color.fromARGB(255, 162, 255, 129),
//                 child: Text('Login'),
//                 onPressed: () async {
//                   final prefs = await SharedPreferences.getInstance();
//                   await prefs.setString('user', userController.text);
//                   Get.offAll(() => HomePage());
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/login_controller.dart';
import 'package:latihan2_11pplg1/Widgets/widget_button.dart';
import 'package:latihan2_11pplg1/Widgets/widget_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // final controller = Get.find<LoginController>();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        margin: EdgeInsets.only(top: 25),
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
              CustomButton(
                text: "Login",
                textColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  controller.login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
