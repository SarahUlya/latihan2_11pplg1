import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../db_helper.dart';

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final searchController = TextEditingController();

  final names = <Map<String, dynamic>>[].obs;
  var searchQuery = "".obs;

  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.assignAll(data);
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> deleteName(int id) async {
    await _dbHelper.deleteName(id);
    fetchNames();
  }

  Future<void> editName(int id, String newName) async {
    if (newName.trim().isEmpty) return;
    await _dbHelper.updateName(id, newName.trim());
    fetchNames();
  }

  void editNameDialog(BuildContext context, int id, String oldName) {
    final editController = TextEditingController(text: oldName);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Name"),
        content: TextField(controller: editController),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              editName(id, editController.text);
              Get.back();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void Delete(int id, String name) {
  Get.defaultDialog(
    title: "Konfirmasi",
    middleText: "Yakin mau hapus kontak \"$name\"?",
    textCancel: "Batal",
    textConfirm: "Hapus",
    confirmTextColor: const Color.fromARGB(255, 255, 255, 255),
    onConfirm: () {
      deleteName(id);
      Get.back();
      Get.snackbar(
        "Berhasil",
        "Kontak \"$name\" sudah dihapus",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        colorText: Colors.white,
      );
    },
  );
}


  List<Map<String, dynamic>> get filteredNames {
    if (searchQuery.value.isEmpty) {
      return names;
    } else {
      final q = searchQuery.value.toLowerCase();
      return names
          .where((contact) => contact['name'].toString().toLowerCase().contains(q))
          .toList();
    }
  }

  void searchName(String query) {
    searchQuery.value = query;
  }

  @override
  void onClose() {
    nameController.dispose();
    searchController.dispose();
    super.onClose();
  }
}
