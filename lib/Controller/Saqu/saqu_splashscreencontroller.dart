import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Routes/routes.dart';

class SaquSplashscreencontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextPage();
  }

  Future<void> navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offAllNamed(AppRoutes.initial);
  }
}
