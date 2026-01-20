import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Components/cat_card.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/cat_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';

class CatListPage extends StatelessWidget {
  final catController = Get.find<CatController>();
  final favController = Get.find<FavoriteController>();
  final username = Get.find<AuthController>().username.value;

  CatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Kucing"),
        backgroundColor: const Color.fromARGB(255, 80, 146, 201),
      ),
      body: Obx(() {
        if (catController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (catController.errorMessage.isNotEmpty) {
          return Center(child: Text(catController.errorMessage.value));
        }

        return ListView.builder(
          itemCount: catController.cats.length,
          itemBuilder: (_, index) {
            final cat = catController.cats[index];
            return CatCard(
              cat: cat,
              onFavorite: () async {
                final username = Get.find<AuthController>().username.value;
                await favController.addFavorite(cat, username);
                Get.snackbar(
                  "Favorite",
                  "${cat.name} ditambahkan ke favorite!",
                  snackPosition: SnackPosition.TOP,
                );
              },
            );
          },
        );
      }),
    );
  }
}
