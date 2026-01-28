import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:latihan2_11pplg1/Bindings/payment/payment_binding.dart';
import 'package:latihan2_11pplg1/Bindings/saqu/homebinding.dart';
import 'package:latihan2_11pplg1/Bindings/saqu/splashscreen_binding.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/edit_saqu_page.dart';
import 'package:latihan2_11pplg1/Pages/saqu/saqu_initialpage.dart';
import 'package:latihan2_11pplg1/Pages/saqu/splashscreen.dart';
import 'package:latihan2_11pplg1/Pages/payment/midtrans_page.dart';
import 'package:latihan2_11pplg1/Pages/payment/payment_page.dart';
import 'package:latihan2_11pplg1/Pages/saqu/addSaqu_page.dart';
import 'package:latihan2_11pplg1/Routes/routes.dart';

class AppPagess {
  // lisr array
  static final pages = [
    GetPage(
      name: AppRoutes.sqsplashScreen,
      page: () => SaquSplashscreen(),
      binding: SaquSplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => SaquInitialpage(),
      bindings: [SaquHomeBinding()],
    ),

    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.midtrans,
      page: () => const MidtransPage(snapToken: 'SNAP_TOKEN_CONTOH'),
    ),
    GetPage(name: AppRoutes.testing, page: () => AddsaquPage()),
    // add other collection
  ];
}
