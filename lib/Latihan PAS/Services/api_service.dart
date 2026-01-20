import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan2_11pplg1/Latihan%20PAS/Models/cat.dart';

class ApiService {
  static Future<List<Cat>> getCats() async {
    final url = Uri.parse(
        "https://api.thecatapi.com/v1/breeds?limit=10&page=1");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Cat.fromJson(json)).toList();
    } else {
      throw Exception("Gagal memuat data kucing");
    }
  }
}
