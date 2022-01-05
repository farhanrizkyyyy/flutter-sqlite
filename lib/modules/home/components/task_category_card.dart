// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';
import 'package:my_task/modules/task_list/screens/task_list_screen.dart';

class TaskCategoryCard extends StatelessWidget {
  TaskCategoryCard({
    Key? key,
    required this.isCompleted,
    required this.title,
    required this.categoryId,
  }) : super(key: key);

  bool isCompleted;
  String title;
  int categoryId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskListScreen(
            categoryId: categoryId,
            categoryName: title,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              color: Palette.placeholder,
              blurRadius: 6,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: isCompleted ? Color(0xff8FBC30) : Color(0xffFC9918),
              ),
            ),
            divide14,
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Palette.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              categoryId.toString(),
              style: TextStyle(
                fontSize: 10,
                color: Palette.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              isCompleted
                  ? 'Yay! Your task is done!'
                  : 'You have task available',
              style: TextStyle(
                fontSize: 8,
                color: Palette.placeholder,
                fontWeight: FontWeight.w600,
              ),
            ),
            // divide14,
          ],
        ),
      ),
    );
  }
}
