import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/auth_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/cat_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Database/db_helper.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Models/cat.dart';

class FavoriteController extends GetxController {
  var favorites = <Cat>[].obs;
  var isLoading = false.obs;

  final db = DbHelper();

  @override
  void onInit() {
    super.onInit();
    final username = Get.find<AuthController>().username.value;
    if (username.isNotEmpty) loadFavorites(username);
  }

  Future<void> loadFavorites(String username) async {
    isLoading.value = true;
    favorites.value = await db.getFavoritesByUser(username);
    isLoading.value = false;
  }

  Future<void> addFavorite(Cat cat, String username) async {
    await db.insertFavorite(cat, username);

    // Update CatController
    final catController = Get.find<CatController>();
    final index = catController.cats.indexWhere((c) => c.id == cat.id);
    if (index != -1) {
      catController.cats[index].isFavorite.value = true;
    }

    favorites.add(cat);
  }

  Future<void> removeFavorite(String id, String username) async {
    await db.deleteFavorite(id, username);

    // Update CatController
    final catController = Get.find<CatController>();
    final index = catController.cats.indexWhere((c) => c.id == id);
    if (index != -1) {
      catController.cats[index].isFavorite.value = false;
    }

    favorites.removeWhere((f) => f.id == id);
  }

  Future<bool> isFavorite(String id, String username) async {
    return await db.isFavorite(id, username);
  }

  void clearFavorites() {
  // Reset isFavorite di semua CatController
  final catController = Get.find<CatController>();
  for (var cat in catController.cats) {
    cat.isFavorite.value = false;
  }

  favorites.clear();
}

}
