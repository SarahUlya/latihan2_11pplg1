import 'package:flutter/material.dart';

class HomeActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const HomeActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Ukuran kotak (sesuaikan jika ingin lebih besar/kecil)
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Sudut melengkung
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
            // Icon Plus Biru
            Icon(
              icon,
              size: 32,
              color: const Color(0xFF4A76E1), // Warna biru sesuai tema
            ),
            const SizedBox(height: 5),
            // Teks "Add"
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
