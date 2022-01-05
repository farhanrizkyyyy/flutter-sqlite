// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';
import 'package:my_task/modules/task_list/components/task_card.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);

  int categoryId;
  String categoryName;

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
        onPressed: () {},
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.edit,
            color: Color(0xffFBD148),
          ),
        ),
        divideW24,
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.delete,
            color: Palette.error,
          ),
        ),
        divideW20,
      ],
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.chevron_left),
        color: Colors.black,
        iconSize: 30,
      ),
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                categoryName,
                style: TextStyle(
                  color: Palette.primary,
                  fontSize: 24,
                ),
              ),
              Text(
                DateTime.now().toString(),
                style: TextStyle(
                  color: Palette.placeholder,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        divide20,
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            children: List.generate(
              100,
              (index) => Column(
                children: [
                  // TaskCard(
                  //   taskName: 'taskName',
                  //   desc: 'desc',
                  //   dueDate: 'dueDate',
                  // ),
                  divide20,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
