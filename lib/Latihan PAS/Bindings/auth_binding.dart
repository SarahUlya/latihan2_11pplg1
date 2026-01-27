import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }
}