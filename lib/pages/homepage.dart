import 'package:day1/utilis/alertbox.dart';
import 'package:day1/utilis/todotile.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //list of todolist
  List Todolist = [
    ["make turorial", false],
    ["do exercise", false]
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      Todolist[index][1] = !Todolist[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "To Do",
            style: TextStyle(color: Colors.blue),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              createNewTask();
            },
            child: Icon(Icons.add)),
        body: ListView.builder(
            itemCount: Todolist.length,
            itemBuilder: (context, index) {
              return Todotile(
                  taskName: Todolist[index][0],
                  taskcompleted: Todolist[index][1],
                  onChanged: (value) => checkBoxChanged(value, index));
            }));
  }
}
