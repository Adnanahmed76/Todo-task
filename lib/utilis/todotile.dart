import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  final String taskName;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Todotile(
      {super.key,
      required this.taskName,
      required this.taskcompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
//check box
            Checkbox(
              value: taskcompleted,
              onChanged: onChanged,
              activeColor: Colors.blue,
            ),
            //task name
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskcompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
