import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/saqu_controller.dart';
import 'package:latihan2_11pplg1/models/saqu_model.dart';

class EditSaquPage extends StatefulWidget {
  final SaquModel expense;

  const EditSaquPage({super.key, required this.expense});

  @override
  State<EditSaquPage> createState() => _EditSaquPageState();
}

class _EditSaquPageState extends State<EditSaquPage> {
  final controller = SaquController();
  late TextEditingController _amountController;
  late TextEditingController _descController;
  late String _selectedCategory;

  final List<String> _categories = ['Makanan', 'Minuman', 'Snack', 'Saldo'];

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data yang sudah ada
    _amountController = TextEditingController(
      text: widget.expense.amount.toString(),
    );
    _descController = TextEditingController(text: widget.expense.description);
    _selectedCategory = widget.expense.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detail",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C6ED7),
              ),
            ),
            const SizedBox(height: 30),

            // Field Jumlah
            _buildEditField(
              controller: _amountController,
              hint: "Jumlah",
              iconAsset: "assets/rp.png",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Field Kategori (Dropdown)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
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
            const SizedBox(height: 20),

            // Field Keterangan
            _buildEditField(
              controller: _descController,
              hint: "Keterangan",
              iconAsset: "assets/note.png",
              maxLines: 4,
            ),
            const SizedBox(height: 40),

            // Tombol Edit (Update)
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C79E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                onPressed: () async {
                  if (_amountController.text.isNotEmpty) {
                    await controller.updateExpense(
                      widget.expense.id,
                      SaquModel(
                        id: widget.expense.id,
                        amount: int.parse(_amountController.text),
                        category: _selectedCategory,
                        description: _descController.text,
                        date: widget.expense.date,
                      ),
                    );
                    Get.back(); // Kembali ke home setelah sukses
                    Get.snackbar(
                      "Sukses",
                      "Data berhasil diubah",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, size: 24, color: Colors.white),
                    Text(
                      "Edit",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                onPressed: () async {
                  await controller.deleteExpense(widget.expense.id);
                  Get.back();

                  // Get.snackbar(
                  //   "Sukses",
                  //   "Data berhasil dihapus", // Fix: teks pesan
                  //   snackPosition: SnackPosition.BOTTOM,
                  //   backgroundColor: Colors.red,
                  //   colorText: Colors.white,
                  //   margin: const EdgeInsets.all(15),
                  // );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, size: 24, color: Colors.white),
                    Text(
                      "Delete",
                      style: TextStyle(color: Colors.white, fontSize: 14),
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

  Widget _buildEditField({
    required TextEditingController controller,
    required String hint,
    required String iconAsset,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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
