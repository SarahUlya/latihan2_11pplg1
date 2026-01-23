import 'package:flutter/material.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/saqu_controller.dart';
import 'package:latihan2_11pplg1/models/saqu_model.dart';

class AddsaquPage extends StatelessWidget {
  final controller = SaquController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Pengeluaran')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await controller.addExpense(
                SaquModel(
                  id: '',
                  amount: 15000,
                  category: 'Makan',
                  description: 'Bakso',
                  date: DateTime.now(),
                ),
              );
            },
            child: Text('ADD TEST DATA'),
          ),
          Expanded(
            child: StreamBuilder<List<SaquModel>>(
              stream: controller.getExpenses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Belum ada data'));
                }

                final expenses = snapshot.data!;

                return ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    final expense = expenses[index];

                    return ListTile(
                      title: Text(expense.description),
                      subtitle: Text(expense.category),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              controller.updateExpense(
                                expense.id,
                                SaquModel(
                                  id: expense.id,
                                  amount: 15000,
                                  category: expense.category,
                                  description: expense.description,
                                  date: expense.date,
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteExpense(expense.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
