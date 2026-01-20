import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/login_api_controller.dart';

class LoginApiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}