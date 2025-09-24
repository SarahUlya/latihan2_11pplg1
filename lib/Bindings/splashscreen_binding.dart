import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}