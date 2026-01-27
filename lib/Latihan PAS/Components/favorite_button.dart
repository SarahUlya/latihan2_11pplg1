import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Models/cat.dart';

class FavoriteButton extends StatelessWidget {
  final Cat cat;
  const FavoriteButton({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final fav = Get.find<FavoriteController>();
    // final username = Get.find<AuthController>().username.value;


    return Obx(() {
  final isFav = cat.isFavorite.value;
  final username = Get.find<AuthController>().username.value;

  return ElevatedButton(
    onPressed: () async {
      if (isFav) {
        await fav.removeFavorite(cat.id, username);
        cat.isFavorite.value = false;
        Get.snackbar("Favorite", "${cat.name} dihapus!");
      } else {
        await fav.addFavorite(cat, username);
        cat.isFavorite.value = true;
        Get.snackbar("Favorite", "${cat.name} ditambahkan!");
      }
    },
    child: Text(isFav ? "Hapus Favorite" : "Tambah Favorite"),
  );
});

  }
}
