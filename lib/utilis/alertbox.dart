import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 200,
        child: Column(
          children: [
            //get user import
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            //button -> save -> cancel
          ],
        ),
      ),
    );
  }
}
