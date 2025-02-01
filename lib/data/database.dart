import 'package:hive/hive.dart';

class TodoDatabase {
  List toDoList = [];
  //reference our box
  final _mybox = Hive.box("mybox");

//run this nethod of this is the 1st ever time opening this app
  void createInitialData() {
    toDoList = [
      [
        "make Tutorial",
        false,
      ],
      ["Do Exercise", false]
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
