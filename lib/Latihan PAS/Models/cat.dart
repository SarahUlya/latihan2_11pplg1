import 'package:get/get.dart';

class Cat {
  final String id;
  final String name;
  final String origin;
  final String temperament;
  final String? imageUrl;
  final String? referenceImageId;

  RxBool isFavorite;
  final String username;

  Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.temperament,
    required this.imageUrl,
    required this.referenceImageId,
    RxBool? isFavorite,
    required this.username,
  }) : isFavorite = isFavorite ?? false.obs;

  factory Cat.fromJson(Map<String, dynamic> json) {
    final imageData = json['image'];
    String? imgUrl;

    if (imageData is Map && imageData['url'] != null) {
      imgUrl = imageData['url'];
    }

    return Cat(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      origin: json['origin'] ?? '',
      temperament: json['temperament'] ?? '',
      imageUrl: imgUrl,
      referenceImageId: json['reference_image_id'],
      isFavorite: ((json["isFavorite"] ?? false) as bool).obs,
      username: json['username'] ?? '',

    );
  }

  factory Cat.fromDb(Map<String, dynamic> data, String currentUsername) {
  return Cat(
    id: data['id'],
    name: data['name'],
    origin: data['origin'],
    temperament: data['temperament'],
    imageUrl: data['image'],
    referenceImageId: null,
    isFavorite: (data['username'] == currentUsername).obs,
    username: data['username'],
  );
}


  String get displayImage {
    if (imageUrl != null) return imageUrl!;
    if (referenceImageId != null) {
      return "https://cdn2.thecatapi.com/images/$referenceImageId.jpg";
    }
    return "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg";
  }
}
