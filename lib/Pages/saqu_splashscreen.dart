import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaquSplashscreen extends StatelessWidget {
  const SaquSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            Text(
              'SaQu',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(70, 104, 191, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
