import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contoh stack')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Container(
                  height: 200,
                  color: const Color.fromARGB(255, 242, 0, 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            size: 70,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Tas Shopping :",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Rp. 20.000",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
