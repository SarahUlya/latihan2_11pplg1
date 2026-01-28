import 'package:flutter/material.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/saqu_controller.dart';
import 'package:latihan2_11pplg1/models/saqu_model.dart';

class AddsaquPage extends StatefulWidget {
  const AddsaquPage({super.key});

  @override
  State<AddsaquPage> createState() => _AddsaquPageState();
}

class _AddsaquPageState extends State<AddsaquPage> {
  final controller = SaquController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String _selectedCategory = 'Makanan';
  final List<String> _categories = ['Makanan', 'Minuman', 'Snack', 'Saldo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add to Saqu",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C6ED7),
              ),
            ),
            SizedBox(height: 30),

            // Field Jumlah (Input Saldo/Pengeluaran)
            _buildInputField(
              controller: _amountController,
              hint: "Jumlah",
              iconAsset: "assets/rp.png",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Field Dropdown Kategori
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    icon: Image.asset("assets/kategori.png", width: 24),
                    border: InputBorder.none,
                  ),
                  items: _categories.map((String val) {
                    return DropdownMenuItem(value: val, child: Text(val));
                  }).toList(),
                  onChanged: (value) =>
                      setState(() => _selectedCategory = value!),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Field Keterangan
            _buildInputField(
              controller: _descController,
              hint: "Keterangan",
              iconAsset: "assets/note.png",
              maxLines: 4,
            ),
            SizedBox(height: 40),

            // Tombol Add (Sesuai Foto)
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5C79E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () async {
                  if (_amountController.text.isNotEmpty) {
                    await controller.addExpense(
                      SaquModel(
                        id: '',
                        amount: int.parse(_amountController.text),
                        category: _selectedCategory,
                        description: _descController.text,
                        date: DateTime.now(),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 30, color: Colors.white),
                    Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Input agar rapi
  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required String iconAsset,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          icon: Image.asset(iconAsset, width: 24),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:latihan2_11pplg1/Controller/Saqu/saqu_controller.dart';
// import 'package:latihan2_11pplg1/models/saqu_model.dart';

// class AddsaquPage extends StatelessWidget {
//   AddsaquPage({super.key});
//   final controller = SaquController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tambah Pengeluaran')),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               await controller.addExpense(
//                 SaquModel(
//                   id: '',
//                   amount: 15000,
//                   category: 'Makan',
//                   description: 'Bakso',
//                   date: DateTime.now(),
//                 ),
//               );
//             },
//             child: Text('ADD TEST DATA'),
//           ),
//           Expanded(
//             child: StreamBuilder<List<SaquModel>>(
//               stream: controller.getExpenses(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('Belum ada data'));
//                 }

//                 final expenses = snapshot.data!;

//                 return ListView.builder(
//                   itemCount: expenses.length,
//                   itemBuilder: (context, index) {
//                     final expense = expenses[index];

//                     return ListTile(
//                       title: Text(expense.description),
//                       subtitle: Text(expense.category),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.edit),
//                             onPressed: () {
//                               controller.updateExpense(
//                                 expense.id,
//                                 SaquModel(
//                                   id: expense.id,
//                                   amount: 15000,
//                                   category: expense.category,
//                                   description: expense.description,
//                                   date: expense.date,
//                                 ),
//                               );
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete),
//                             onPressed: () {
//                               controller.deleteExpense(expense.id);
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
