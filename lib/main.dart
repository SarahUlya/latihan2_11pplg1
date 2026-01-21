import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:latihan2_11pplg1/Latihan PAS/Controller/auth_controller.dart';
import 'package:latihan2_11pplg1/Latihan PAS/Controller/cat_controller.dart';
import 'package:latihan2_11pplg1/Latihan PAS/Controller/favorite_controller.dart';

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
  WidgetsFlutterBinding.ensureInitialized();

  // ===== GLOBAL CONTROLLERS (AMAN, JANGAN DIHAPUS) =====
  Get.put(AuthController(), permanent: true);
  Get.put(CatController(), permanent: true);
  Get.put(FavoriteController(), permanent: true);

  // await Firebase.initializeApp();
  // Get.put(NotificationController());
  // Get.put(LoginApiController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // ✅ LANGSUNG MASUK PAYMENT (UNTUK TEST)
      initialRoute: AppRoutes.payment,

      // ✅ ROUTES GETX
      getPages: AppPagess.pages,

      debugShowCheckedModeBanner: false,
    );
  }
}
