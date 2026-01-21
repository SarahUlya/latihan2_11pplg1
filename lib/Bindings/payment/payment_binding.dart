import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/payment/payment_controller.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}