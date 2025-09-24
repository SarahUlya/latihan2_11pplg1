import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:latihan2_11pplg1/Bindings/login_binding.dart';
import 'package:latihan2_11pplg1/Bindings/splashscreen_binding.dart';
import 'package:latihan2_11pplg1/Pages/home_page.dart';
import 'package:latihan2_11pplg1/Pages/login_page.dart';
import 'package:latihan2_11pplg1/Pages/splash_screen.dart';
import 'package:latihan2_11pplg1/Routes/routes.dart';

class AppPages {
  // lisr array
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreenPage(), binding: SplashscreenBinding()),
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.home, page: () => HomePage(),),
    // add other collection
  ];
}