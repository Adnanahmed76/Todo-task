import 'package:flutter/material.dart';
import 'package:slideable/slideable.dart';

class Todotile extends StatelessWidget {
  final String taskName;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  final VoidCallback onDelete;
  Todotile(
      {super.key,
      required this.taskName,
      required this.taskcompleted,
      required this.onChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slideable(
        backgroundColor: Colors.yellow,
        items: [
          ActionItems(
              radius: BorderRadius.circular(10),
              backgroudColor: Colors.red,
              icon: Icon(Icons.delete),
              onPress: onDelete),
        ],
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
      ),
    );
  }
}
