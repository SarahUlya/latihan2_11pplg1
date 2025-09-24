import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
 final bool isPassword ;

  const customTextField({super.key, required this.textEditingController, required this.labelText, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(label: Text(labelText)),
      obscureText: isPassword,
    );
  }
}