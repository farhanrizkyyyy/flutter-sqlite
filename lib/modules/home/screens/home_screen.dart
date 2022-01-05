// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';
import 'package:my_task/helpers/db.helper.dart';
import 'package:my_task/modules/add_task/screens/add_Task_screen.dart';
import 'package:my_task/modules/home/components/top_section.dart';
import 'package:my_task/modules/sign_in/screens/sign_in_screen.dart';
import 'package:my_task/modules/task_list/components/task_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  String username;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> tasks = [];

  DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    dbHelper.initDB();
    getdata();
    super.initState();
  }

  getdata() {
    Future.delayed(Duration(milliseconds: 500), () async {
      final db = await dbHelper.initDB();

      tasks = await db.rawQuery('SELECT * FROM Tasks');

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(context),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: Palette.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(
                  username: widget.username,
                ),
              ),
            );
          }),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primary,
      leading: Container(),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            // Navigator.pushReplacementNamed(context, SignInScreen.path);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
            );
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        TopSection(
          username: widget.username,
          allTask: '1',
          inProgress: '4',
          completed: '20',
        ),
        tasks.isEmpty
            ? Column(
                children: [
                  divide80,
                  Center(
                    child: Text('Data is empty'),
                  ),
                ],
              )
            : Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                    tasks.length,
                    (index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final db = await dbHelper.initDB();

                              final taskId = tasks[index]['taskId'];

                              db.rawQuery(
                                "UPDATE Tasks SET isDone = 'true' WHERE taskId = $taskId",
                              );

                              setState(() {});
                            },
                            child: TaskCard(
                              taskId: tasks[index]['taskId'],
                              taskName: tasks[index]['taskName'],
                              desc: tasks[index]['description'],
                              dueDate: tasks[index]['dueDate'],
                              isDone: tasks[index]['isDone'],
                            ),
                          ),
                          divide20,
                        ],
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
