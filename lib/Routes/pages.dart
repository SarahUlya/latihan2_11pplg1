import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:latihan2_11pplg1/Bindings/contact_binding.dart';
import 'package:latihan2_11pplg1/Bindings/example_binding.dart';
import 'package:latihan2_11pplg1/Bindings/login_api_binding.dart';
import 'package:latihan2_11pplg1/Bindings/login_binding.dart';
import 'package:latihan2_11pplg1/Bindings/premiere_binding.dart';
import 'package:latihan2_11pplg1/Bindings/splashscreen_binding.dart';
import 'package:latihan2_11pplg1/Pages/contact_page.dart';
import 'package:latihan2_11pplg1/Pages/example_page.dart';
import 'package:latihan2_11pplg1/Pages/home_page.dart';
import 'package:latihan2_11pplg1/Pages/login_api.dart';
import 'package:latihan2_11pplg1/Pages/login_page.dart';
import 'package:latihan2_11pplg1/Pages/premiere_tabel.dart';
import 'package:latihan2_11pplg1/Pages/splash_screen.dart';
import 'package:latihan2_11pplg1/Routes/routes.dart';

class AppPages {
  // lisr array
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreenPage(), binding: SplashscreenBinding()),
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.home, page: () => HomePage(),),
    GetPage(name: AppRoutes.contact, page: () => ContactPage(), binding: ContactBinding()),
    GetPage(name: AppRoutes.examplescreen, page: () => ExamplePage(), binding: ExampleBinding()),
    GetPage(name: AppRoutes.loginapi, page: () => LoginApiPage(), binding: LoginApiBinding()),
    GetPage(name: AppRoutes.premieretable, page: () => PremiereTabelPage(), binding: PremiereBinding()),
    // add other collection
  ];
}