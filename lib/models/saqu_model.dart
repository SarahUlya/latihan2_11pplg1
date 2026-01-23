import 'package:cloud_firestore/cloud_firestore.dart';

class SaquModel {
  final String id;
  final int amount;
  final String category;
  final String description;
  final DateTime date;

  SaquModel({
    required this.id,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
  });

  factory SaquModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SaquModel(
      id: doc.id,
      amount: data['amount'],
      category: data['category'],
      description: data['description'],
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'category': category,
      'description': description,
      'date': Timestamp.fromDate(date),
    };
  }
}
