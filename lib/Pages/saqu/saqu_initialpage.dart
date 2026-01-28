import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/edit_saqu_page.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/saqu_controller.dart';
import 'package:latihan2_11pplg1/models/saqu_model.dart';
import 'package:latihan2_11pplg1/Pages/payment/payment_page.dart';
import 'package:latihan2_11pplg1/Pages/saqu/addSaqu_page.dart';
import 'package:latihan2_11pplg1/Widgets/saqu/balance_card.dart';
import 'package:latihan2_11pplg1/Widgets/saqu/home_action_button.dart';
import 'package:latihan2_11pplg1/Widgets/saqu/premium_action_button.dart';

class SaquInitialpage extends StatelessWidget {
  SaquInitialpage({super.key});

  final SaquController saquController = SaquController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<SaquModel>>(
        stream: saquController.getExpenses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final listData = snapshot.data ?? [];

          double uangMasuk = listData
              .where((item) => item.category == 'Saldo')
              .fold(0.0, (sum, item) => sum + item.amount);

          double uangKeluar = listData
              .where((item) => item.category != 'Saldo')
              .fold(0.0, (sum, item) => sum + item.amount);

          double saldoAkhir = uangMasuk - uangKeluar;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BalanceCard(
                  totalBalance: saldoAkhir,
                  totalPengeluaran: uangKeluar,
                ),

                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      HomeActionButton(
                        label: "Add",
                        icon: Icons.add,
                        onTap: () => Get.to(() => const AddsaquPage()),
                      ),
                      const SizedBox(width: 15),
                      PremiumActionButton(
                        onTap: () => Get.to(() => PaymentPage()),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // --- 3. JUDUL RIWAYAT ---
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Riwayat",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C6ED7),
                    ),
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listData.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemBuilder: (context, index) {
                    final item = listData[index];
                    bool isSaldo = item.category == 'Saldo';

                    return InkWell(
                      onTap: () => Get.to(
                        () => EditSaquPage(expense: item),
                      ), // Navigasi ke Edit Page
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          // Tambahkan shadow atau border sesuai desain foto ke-3
                          // border: Border.all(
                          //   color: item.category == 'Snack'
                          //       ? const Color(0xFF4C6ED7)
                          //       : Colors.transparent,
                          //   width: 2,
                          // ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Icon Kategori
                            Image.asset(
                              "assets/${item.category.toLowerCase()}.png",
                              width: 40,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.category,
                                    color: Colors.grey,
                                  ),
                            ),
                            const SizedBox(width: 15),
                            // Deskripsi
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.category,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.description,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Nominal
                            Text(
                              "${isSaldo ? '+' : '-'} Rp ${NumberFormat('#,###').format(item.amount)}",
                              style: TextStyle(
                                color: isSaldo ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
