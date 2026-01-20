import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan2_11pplg1/Pages/home_page.dart';
import 'package:latihan2_11pplg1/Pages/profile_page.dart';
import 'package:latihan2_11pplg1/client_network.dart';
import 'package:latihan2_11pplg1/models/login_model.dart';
import 'package:latihan2_11pplg1/sharedpref_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginApiController extends GetxController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void LoginApi() async {
    final username = userController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Username dan password tidak boleh kosong");
      return;
    }

    try {
      isLoading.value = true;

      var url = Uri.parse("${ClientNetwork.baseUrl}login");
      var response = await http.post(
        url,
        body: {
          "username": userController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        loginModel.value = LoginModel.fromJson(data);

        if (loginModel.value == null) {
          Get.snackbar("Error", "Data login kosong!");
          return;
        }

        final result = loginModel.value!;

        if (result.status) {
          if (result.token != null) {
            await SharedPrefHelper.saveToken(result.token!);
            print("Token disimpan: ${result.token}");
          } else {
            print("Token tidak ditemukan di response");
          }

          Get.snackbar("Success", result.message);
          Get.off(() => HomePage());
        } else {
          Get.snackbar("Error", result.message);
        }
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghubungi server (${response.statusCode})",
        );
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
    isLoading.value = false;
  }

  loginWithGoogle() async {
  try {
    // pastikan logout dulu biar bisa pilih akun setiap kali
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return; // user batal login

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Get.snackbar("Login Berhasil", "Selamat datang ${googleUser.displayName}");
    Get.offAll(() => ProfilePage());
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
}

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await SharedPrefHelper.clearToken();
    Get.snackbar("Logout", "Berhasil keluar akun");
  }

  @override
  void onClose() {
    userController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
