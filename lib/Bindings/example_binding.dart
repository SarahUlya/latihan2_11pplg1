import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/example_controller.dart';

class ExampleBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}