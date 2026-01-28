import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/homecontroller.dart';

class BalanceCard extends StatelessWidget {
  final double totalBalance;
  final double totalPengeluaran;

  const BalanceCard({
    super.key,
    required this.totalBalance,
    required this.totalPengeluaran,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    // Fungsi untuk format ke Rupiah
    String formatCurrency(double value) {
      return NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp ',
        decimalDigits: 0,
      ).format(value);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(25, 60, 25, 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(35)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2C4688), Color(0xFF638FFF)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF638FFF).withOpacity(0.5),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER: Avatar, Nama, Notifikasi ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFF2C4688)),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Halo, Madi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 35),

          // --- LABEL SALDO & VISIBILITY TOGGLE ---
          Row(
            children: [
              const Text(
                "Saldo Utama",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => controller.toggleSaldoVisibility(),
                child: Obx(
                  () => Icon(
                    controller.isSaldoVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white70,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // --- NOMINAL SALDO ---
          Obx(() {
            return Text(
              controller.isSaldoVisible.value
                  ? formatCurrency(totalBalance)
                  : "Rp ••••••••••",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            );
          }),

          const SizedBox(height: 25),

          // --- BAGIAN PENGELUARAN ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Obx(() {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_downward,
                    color: Colors.white70,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "Pengeluaran : ",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    controller.isSaldoVisible.value
                        ? formatCurrency(totalPengeluaran)
                        : "Rp ••••••",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
