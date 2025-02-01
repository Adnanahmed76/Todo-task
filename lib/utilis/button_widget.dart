import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  VoidCallback onPress;
  ButtonWidget({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPress, color: Colors.yellow[100], child: Text(text));
  }
}
