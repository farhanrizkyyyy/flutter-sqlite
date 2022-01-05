// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  late Database db;

  Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    final path = join(dbPath, 'myTask.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Tasks(
        taskId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        taskName VARCHAR(100) NOT NULL,
        description VARCHAR(100) NOT NULL,
        createdBy VARCHAR(100) NOT NULL,
        dueDate VARCHAR(100) NOT NULL,
        isDone VARCHAR(100) NOT NULL
      );
    ''');

    print(
        '========================================= TABLE CREATED =========================================');
  }

  Future closeDB() async {
    final db = await initDB();

    db.close();
  }
}
