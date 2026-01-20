import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var username = ''.obs;
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();
  final savedUsername = prefs.getString("username");

  // Optional: sedikit delay untuk smooth splash
  await Future.delayed(Duration(milliseconds: 200));

  if (savedUsername != null) {
    username.value = savedUsername;
    isLoggedIn.value = true;
    Get.offAllNamed('/home');
  } else {
    Get.offAllNamed('/login');
  }
}


  Future<void> login(String user, String pass) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    if (user.isEmpty || pass.isEmpty) {
      Get.snackbar("Eror", "Username dan password tidak boleh kosong!");
      isLoading.value = false;
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", user);

    username.value = user;
    isLoggedIn.value = true;

    Get.offAllNamed('/home');
  }

  Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("username");
  username.value = '';
  isLoggedIn.value = false;

  final favController = Get.find<FavoriteController>();
  favController.clearFavorites();
  Get.offAllNamed('/login');
}

}
