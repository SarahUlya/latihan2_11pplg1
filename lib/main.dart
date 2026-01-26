import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/cat_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';
// import 'package:latihan2_11pplg1/Controller/login_api_controller.dart';
// import 'package:latihan2_11pplg1/Controller/notification_controller.dart';
// import 'package:latihan2_11pplg1/Routes/pages.dart' hide AppPages;
// import 'package:latihan2_11pplg1/Routes/routes.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:latihan2_11pplg1/home_screen.dart';
import 'package:latihan2_11pplg1/Latihan PAS/Routes/app_pages.dart';
import 'package:latihan2_11pplg1/Routes/pages.dart';
import 'package:latihan2_11pplg1/Routes/routes.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); //untuk app cat
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isLoggedIn = prefs.getBool('isLogged') ?? false;

  // Get.put(AuthController());
  // Get.put(CatController());
  // Get.put(FavoriteController());

  runApp(MyApp());

  // await Firebase.initializeApp();
  // Get.put(NotificationController());
  // Get.put(LoginApiController());

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final bool isLoggedIn;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      // home: HomeScreen(),

      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      // initialRoute: AppRoutes.loginapi,
      // getPages : AppPages.pages,
      title: 'CatApi App',
      initialRoute: AppRoutes.sqsplash,
      getPages: AppPagess.pages,
    );
  }
}
