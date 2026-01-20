import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/cat_controller.dart';

class CatBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CatController());
  }
}