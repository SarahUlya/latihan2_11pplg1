import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
  }
}