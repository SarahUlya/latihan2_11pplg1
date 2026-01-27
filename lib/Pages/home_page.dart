// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:latihan2_11pplg1/Controller/home_controller.dart';
// import 'package:latihan2_11pplg1/Pages/login_page.dart';
// import 'package:latihan2_11pplg1/Pages/splash_screen.dart';
// import 'package:latihan2_11pplg1/Widgets/widget_button.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final controller = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('HomePage'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text(
//                   controller.username.value.isNotEmpty
//                       ? 'Hello ${controller.username.value}'
//                       : 'Loading...',
//                   style: const TextStyle(fontSize: 26),
//                 )),
//             const SizedBox(height: 20),
//             CustomButton(
//               text: "Logout",
//               textColor: const Color.fromARGB(255, 0, 0, 0),
//               onPressed: () async {
//                 await controller.removeUser();
//                 Get.offAll(() => SplashScreenPage());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Pages/login_api.dart';
import 'package:latihan2_11pplg1/Widgets/widget_button.dart';
import 'package:latihan2_11pplg1/sharedpref_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selamat datang di Home Page!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Logout",
              textColor: Colors.black,
              onPressed: () async {
                await SharedPrefHelper.clearToken();
                final token = await SharedPrefHelper.getToken();
                print("Token setelah logout: $token");
                Get.offAllNamed('/loginapi');
              },
            ),
          ],
        ),
      ),
    );
  }
}
