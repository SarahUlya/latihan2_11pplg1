import 'dart:convert';

import 'package:get/get.dart';
import 'package:latihan2_11pplg1/models/tabel_model.dart';
import 'package:http/http.dart' as http;

class PremiereTableController extends GetxController {
  var isLoading = false.obs;
  var standings = <Table>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchPremiereTable();
  }
  
  fetchPremiereTable() async{
    const url = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026";
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url)); 
      print("status code"+response.statusCode.toString());
      print("json result"+response.body);

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final List standingsData = data['table'];
        standings.assignAll(standingsData.map((e) => Table.fromJson(e)).toList());
      } else{
        Get.snackbar("failed", "failed loading data");
      }
    } catch(e){
      Get.snackbar("Eror", e.toString());
    }
    isLoading(false);
  }
}