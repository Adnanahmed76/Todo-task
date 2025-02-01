import 'package:day1/utilis/button_widget.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user import
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Add A New Task"),
            ),
            SizedBox(
              height: 15,
            ),
            //button -> save -> cancel
            Row(
              children: [
                //save button and cancel button
                ButtonWidget(text: "Add", onPress: onSave),
                SizedBox(width: 20),
                ButtonWidget(text: "Cancel", onPress: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
