// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_task/components/custom_form.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';
import 'package:my_task/helpers/db.helper.dart';
import 'package:my_task/modules/home/screens/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  String username;

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    dbHelper.initDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _taskName = TextEditingController();
    TextEditingController _description = TextEditingController();
    TextEditingController _dueDate = TextEditingController();

    DBHelper dbHelper = DBHelper();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: _buildAppbar(context),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insert your task detail here',
              style: TextStyle(
                fontSize: 24,
                color: Palette.primary,
              ),
            ),
            divide48,
            CustomForm(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Task Name',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _taskName.text = value;
                  },
                ),
                divide24,
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _description.text = value;
                  },
                ),
                divide24,
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Due Date',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Palette.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _dueDate.text = value;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          size: 30,
        ),
        backgroundColor: Palette.primary,
        onPressed: () async {
          final db = await dbHelper.initDB();

          final taskName = _taskName.text;
          final description = _description.text;
          final dueDate = _dueDate.text;
          final createdBy = widget.username;
          String isDone = 'false';

          db.rawInsert(
            "INSERT INTO Tasks (taskName, description, createdBy, dueDate, isDone) VALUES ('$taskName', '$description', '$createdBy', '$dueDate', '$isDone')",
          );

          print(
              '========================================= TASK ADDED =========================================');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                username: widget.username,
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.chevron_left),
        color: Colors.black,
        iconSize: 30,
      ),
      elevation: 0,
    );
  }
}
