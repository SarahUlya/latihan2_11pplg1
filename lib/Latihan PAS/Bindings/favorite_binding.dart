import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';

class FavoriteBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(FavoriteController());
  }
}