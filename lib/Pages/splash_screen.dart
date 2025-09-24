// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:latihan2_11pplg1/Pages/home_page.dart';
// import 'package:latihan2_11pplg1/Pages/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// String? finalUser;

// class SplashScreen extends StatefulWidget {
//   SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     getValidationData().whenComplete(() async {
//       Timer(
//   const Duration(seconds: 2),
//   () => Get.offAll(() => finalUser == null ? LoginPage() : HomePage()),
// );

//     });
//     super.initState();
//   }

//   Future getValidationData() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     String? obtainedUser = sharedPreferences.getString('user');
//     setState(() {
//       finalUser = obtainedUser;
//     });
//     print(finalUser);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(child: Icon(Icons.school), radius: 50.0),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: CircularProgressIndicator(backgroundColor: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/splashscreen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final controller = Get.put(SplashscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Ini Splashscreen", style: TextStyle(fontSize: 26),),
        ),
      ),
    );
  }
}
