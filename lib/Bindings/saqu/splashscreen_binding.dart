
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/saqu_splashscreencontroller.dart';

class SaquSplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SaquSplashscreencontroller>(() => SaquSplashscreencontroller());
  }
}