import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latihan2_11pplg1/models/saqu_model.dart';

class SaquController {
  final CollectionReference _expenseRef = 
    FirebaseFirestore.instance.collection('expenses');

//create
  Future<void> addExpense(SaquModel expense) async{
    await _expenseRef.add(expense.toMap());
  }

//read realtime
  Stream <List<SaquModel>> getExpenses(){
    return _expenseRef.orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => SaquModel.fromFirestore(e)).toList());
  }

//read once
  Future<List<SaquModel>> getExpensesOnce() async {
    final snapshot =
        await _expenseRef.orderBy('date', descending: true).get();

    return snapshot.docs
        .map((doc) => SaquModel.fromFirestore(doc))
        .toList();
  }

//update
  Future<void> updateExpense(String id, SaquModel expense) async {
    await _expenseRef.doc(id).update(expense.toMap());
  }

//delete
Future<void> deleteExpense(String id) async {
    await _expenseRef.doc(id).delete();
  }
}