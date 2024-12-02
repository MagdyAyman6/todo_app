import 'package:sqflite/sqflite.dart';

import '../model/task_model.dart';

class LocalDatabase {
  static Database? database;

  static void createDatabase() async {
    database = await openDatabase(
      "todo.db",
      version: 1,
      onCreate: (Database db, int version) {
        print("database created");
        db.execute(
            "CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT ,date TEXT, time TEXT, status TEXT)");
        print("table created");
      },
      onOpen: (db) {
        getDatabase(db);
        print("database opened");
      },
    );
  }

  static Future insertDatabase(
      {required String title,
      required String date,
      required String time,
      required String status}) {
    return database!
        .rawInsert(
            "INSERT INTO todo(title,date,time,status)VALUES ('$title','$date','$time','$status')")
        .then((onValue) {
      print("$onValue raw inserted");
    });
  }

  static void getDatabase(db) {
    List<Task> tasks = [];
    db!.rawQuery("SELECT * FROM todo").then((onValue) {
      for (var i in onValue) {
        tasks.add(Task(
            title: i["title"],
            date: i["date"],
            time: i["time"],
            status: i["status"]));
      }
      // print(onValue);
    });


  }
}
