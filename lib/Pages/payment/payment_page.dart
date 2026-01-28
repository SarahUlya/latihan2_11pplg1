import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan2_11pplg1/config/api_config.dart';
import 'midtrans_page.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  final RxBool isLoading = false.obs;

  Future<void> startPayment() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      debugPrint('➡️ BELI DIPENCET');
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/api/snap'),
        headers: {'Accept': 'application/json'},
      );

      debugPrint('📩 STATUS: ${response.statusCode}');
      debugPrint('📩 BODY: ${response.body}');

      if (response.statusCode != 200) {
        Get.snackbar(
          'Error',
          'Server error: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      final data = jsonDecode(response.body);

      if (!data.containsKey('snap_token')) {
        Get.snackbar(
          'Error',
          'Snap token tidak ada',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      final snapToken = data['snap_token'];

      Get.to(() => MidtransPage(snapToken: snapToken));
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      debugPrint('❌ ERROR: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF4A76E1);
    const Color darkBlue = Color(0xFF2B5DCA);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Upgrade Premium",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER ---
              Row(
                children: [
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   decoration: BoxDecoration(
                  //     color: primaryBlue,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: const Icon(
                  //     Icons.verified,
                  //     color: Colors.white,
                  //     size: 24,
                  //   ),
                  // ),
                  // const SizedBox(width: 10),
                  // const Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "SaQu Premium",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold,
                  //         color: primaryBlue,
                  //       ),
                  //     ),
                  //     Text(
                  //       "Unlock all features",
                  //       style: TextStyle(fontSize: 12, color: Colors.grey),
                  //     ),
                  //   ],
                  // ),
                ],
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView(
                  children: [
                    _buildFeatureCard(
                      icon: Icons.qr_code_scanner,
                      title: "AI Unlimited Scan",
                      desc:
                          "Nikmati kebebasan memindai semua struk belanja Anda tanpa ada batasan kuota harian. Catat setiap transaksi dengan cepat dan akurat.",
                      colors: [primaryBlue, darkBlue],
                    ),
                    const SizedBox(height: 15),
                    _buildFeatureCard(
                      icon: Icons.graphic_eq,
                      title: "AI Voice Record",
                      desc:
                          "Teknologi pengenal suara pintar yang memungkinkan Anda mencatat pengeluaran hanya dengan berbicara. Praktis, tanpa perlu mengetik manual.",
                      colors: [primaryBlue, darkBlue],
                    ),
                    const SizedBox(height: 15),
                    _buildFeatureCard(
                      icon: Icons.upload,
                      title: "AI Upload Scan",
                      desc:
                          "Unggah foto struk dari galeri Anda dan biarkan AI kami mengekstraksi data transaksi secara otomatis untuk laporan keuangan yang rapi.",
                      colors: [primaryBlue, darkBlue],
                    ),
                  ],
                ),
              ),

              // --- TOMBOL BELI (GRADIENT) ---
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Obx(() {
                  // Menggunakan Obx untuk update tampilan saat loading
                  return ElevatedButton(
                    onPressed: isLoading.value ? null : startPayment,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor:
                          Colors.transparent, // Hilangkan shadow bawaan
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4A76E1), Color(0xFF2B5DCA)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: isLoading.value
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text(
                                'Beli Premium',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER UNTUK KARTU FITUR ---
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String desc,
    required List<Color> colors,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: colors[0].withOpacity(0.3),
        //     blurRadius: 8,
        //     offset: const Offset(0, 4),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
