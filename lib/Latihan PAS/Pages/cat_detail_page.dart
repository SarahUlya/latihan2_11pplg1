import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Components/favorite_button.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Models/cat.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cat cat = Get.arguments;
    final fav = Get.find<FavoriteController>();
    fav.isFavorite(cat.id, cat.username).then((value) {
      cat.isFavorite.value = value;
    });

    return Scaffold(
      appBar: AppBar(title: Text(cat.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  cat.displayImage,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Icon(Icons.broken_image, size: 120),
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Nama: ${cat.name}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            Text(
              "Asal: ${cat.origin}",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),

            SizedBox(height: 10),
            Text(
              "Temperament:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(cat.temperament, style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),

            // Ganti FavoriteButton biasa dengan FutureBuilder
            FutureBuilder<bool>(
              future: fav.isFavorite(cat.id, cat.username),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final isFav = snapshot.data ?? false;
                cat.isFavorite.value = isFav;
                return FavoriteButton(cat: cat);
              },
            ),
          ],
        ),
      ),
    );
  }
}
