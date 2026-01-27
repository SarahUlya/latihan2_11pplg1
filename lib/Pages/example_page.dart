import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/example_controller.dart';
import 'package:latihan2_11pplg1/Pages/mobile/example_mobile.dart';
import 'package:latihan2_11pplg1/Pages/widescreen/example_widescreen.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          //deteksi lebar
          controller.updateLayout(constraints);
          //load page
          return Obx(()=> controller.isMobile.value 
          ? ExampleMobile() 
          : ExampleWidescreen());
        }),
    );
  }
}