import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:latihan2_11pplg1/Controller/Saqu/saqu_splashscreencontroller.dart';

class SaquSplashscreen extends StatelessWidget {
  SaquSplashscreen({super.key});

  final controller = Get.find<SaquSplashscreencontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Image(image: AssetImage('assets/logo.png')),
            ),
            Text(
              'SaQu',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(70, 104, 191, 1),
              ),
            ),
            CircularProgressIndicator(color: Color.fromRGBO(70, 104, 191, 1)),
          ],
        ),
      ),
    );
  }
}
