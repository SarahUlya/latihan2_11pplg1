import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/premiere_table_controller.dart';

class PremiereBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PremiereTableController());
  }
}