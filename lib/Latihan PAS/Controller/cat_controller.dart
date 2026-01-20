import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Controller/favorite_controller.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Models/cat.dart';
import 'package:latihan2_11pplg1/Latihan%20PAS/Services/api_service.dart';

class CatController extends GetxController {
  var cats = <Cat>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCats();
  }

  Future<void> fetchCats() async {
    try {
      isLoading(true);
      final data = await ApiService.getCats();

      data.sort((a, b) {
        if (a.id == "beng") return 1;
        if (b.id == "beng") return -1;
        return a.name.compareTo(b.name);
      });

      final favs = Get.find<FavoriteController>().favorites;
      final favIds = favs.map((f) => f.id).toSet();
      for (var cat in data) {
        cat.isFavorite.value = favIds.contains(cat.id);
      }
      
      cats.assignAll(data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
