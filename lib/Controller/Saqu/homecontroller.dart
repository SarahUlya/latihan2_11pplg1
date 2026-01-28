import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  // 1. Variabel Saldo Utama
  var saldo = 12051000.0.obs;

  // 2. Variabel Pengeluaran (State Management Baru)
  var pengeluaran = 350000.0.obs; // Contoh data awal

  // 3. Status Visibilitas
  var isSaldoVisible = true.obs;

  void toggleSaldoVisibility() {
    isSaldoVisible.value = !isSaldoVisible.value;
  }

  // Format Rupiah untuk Saldo
  String get formattedSaldo {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    ).format(saldo.value);
  }

  // 4. Format Rupiah untuk Pengeluaran (Baru)
  String get formattedPengeluaran {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    ).format(pengeluaran.value);
  }

  // Fungsi simulasi tambah pengeluaran (Nanti bisa diganti logic real)
  void addPengeluaran(double amount) {
    pengeluaran.value += amount;
    saldo.value -= amount; // Saldo berkurang otomatis
  }
}
