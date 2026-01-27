import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Pages/login_api.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: user == null
          ? Center(child: Text("Belum login dengan Google"))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.photoURL ?? ""),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    user.displayName ?? "Tidak ada nama",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    user.email ?? "Tidak ada email",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.snackbar(
                        "Logout Berhasil",
                        "Kamu telah keluar dari akun Google",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        colorText: Colors.black,
                      );
                      Get.offAll(() => LoginApiPage());
                    },
                    child: Text("Logout Google"),
                  ),
                ],
              ),
            ),
    );
  }
}
