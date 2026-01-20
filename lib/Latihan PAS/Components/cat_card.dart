import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Models/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  final VoidCallback? onFavorite;
  final favController = Get.find<FavoriteController>();
  final username = Get.find<AuthController>().username.value;

  CatCard({super.key, required this.cat, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200], // supaya PNG transparan kelihatan
            image: DecorationImage(
              image: NetworkImage(cat.displayImage),
              fit: BoxFit.cover,
            ),
          ),
        ),

        title: Text(cat.name),
        subtitle: Text("Origin: ${cat.origin}"),
        trailing: Obx(
          () => IconButton(
            onPressed: () async {
              cat.isFavorite.toggle();
              final username = Get.find<AuthController>().username.value;

              if (cat.isFavorite.value) {
                await favController.addFavorite(cat, username);
              } else {
                await favController.removeFavorite(cat.id, username);
              }
            },
            icon: Icon(
              cat.isFavorite.value ? Icons.favorite : Icons.favorite_border,
              color: cat.isFavorite.value ? Colors.red : Colors.grey,
            ),
          ),
        ),

        onTap: () => Get.toNamed('/detail', arguments: cat),
      ),
    );
  }
}
