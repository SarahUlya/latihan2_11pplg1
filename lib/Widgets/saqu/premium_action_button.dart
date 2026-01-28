import 'package:flutter/material.dart';

class PremiumActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const PremiumActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Warna utama (Biru SaQu)
    const Color primaryBlue = Color(0xFF4A76E1);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80, // Samakan tingginya dengan tombol Add
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // Border Biru Tebal sesuai desain
            border: Border.all(color: primaryBlue, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey, // Bayangan halus
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- BARIS ICON (Scan, Record, Upload) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconWithStar(Icons.qr_code_scanner, primaryBlue),
                  _buildIconWithStar(Icons.graphic_eq, primaryBlue),
                  _buildIconWithStar(Icons.upload, primaryBlue),
                ],
              ),

              const SizedBox(height: 6),

              // --- TEKS ---
              const Text(
                "Beli Fitur Premium",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget kecil untuk bikin Icon ada Bintangnya (Stack)
  Widget _buildIconWithStar(IconData icon, Color color) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon, size: 24, color: color), // Icon Utama
        Positioned(
          right: -2,
          top: -2,
          child: Icon(
            Icons.auto_awesome, // Icon Bintang/Sparkle
            size: 10,
            color: color,
          ),
        ),
      ],
    );
  }
}
