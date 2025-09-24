import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async{
    if(userController.text.toString() == "admin" && passwordController.text.toString() == "admin"){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", userController.text.toString());
      Get.offAllNamed(AppRoutes.home);
    }else{
      Get.snackbar("Eror", "Username atau Password salah");
    }
  }
}