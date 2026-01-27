import 'package:get/route_manager.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/card_product.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/cat_detail_page.dart';
// import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/cat_list_page.dart';
// import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/favorite_page.dart';
// import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/home_page1.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/login_page1.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/main_nav_page.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Pages/splashscreen_page.dart';

class AppPages {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const cats = '/cats';
  static const detail = '/detail';
  static const favorite = '/favorite';
  static const product = '/product';

  static final qroutes = [
    GetPage(name: splash, page: () => SplashscreenPage()),
    GetPage(name: login, page: () => LoginPage1()),
    GetPage(name: home, page: () => MainNavPage()),
    // GetPage(name: cats, page: () => CatListPage()),
    GetPage(name: detail, page: () => CatDetailPage()),
    // GetPage(name: favorite, page: () => FavoritePage()),
    GetPage(name: product, page: () => CardProduct()),
  ];
}
