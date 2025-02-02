import 'package:day1/data/database.dart';
import 'package:day1/utilis/alertbox.dart';
import 'package:day1/utilis/todotile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //reference the hie box
  final _myBox = Hive.box("mybox");
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    // id this is the 1st time ver opening the app then create default data

    if (_myBox.get("TODoLIST") == null) {
      db.createInitialData();
    } else {
      //there alreadt exist data
      db.loadData();
    }
    super.initState();
  }

//for my text controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

//delete task
  void deletetask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
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
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return Todotile(
                taskName: db.toDoList[index][0],
                taskcompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                onDelete: () => deletetask(index),
              );
            }));
  }
}
