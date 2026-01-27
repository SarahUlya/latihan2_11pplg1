import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/contact_controller.dart';

class ContactBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}