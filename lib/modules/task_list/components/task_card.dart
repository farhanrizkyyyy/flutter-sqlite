// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    Key? key,
    required this.taskName,
    required this.desc,
    required this.dueDate,
    required this.taskId,
    required this.isDone,
  }) : super(key: key);

  int taskId;
  String taskName;
  String desc;
  String dueDate;
  String isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            color: Palette.placeholder,
            blurRadius: 6,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: Palette.secondary,
            ),
          ),
          divideW10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      taskName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: isDone != 'false'
                            ? Color(0xff8FBC30)
                            : Color(0xffFC9918),
                      ),
                    ),
                  ],
                ),
                divide4,
                Text(
                  desc,
                  style: TextStyle(
                    color: Palette.placeholder,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                divide8,
                Text(
                  'Due Date',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                divide4,
                Text(
                  dueDate,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // child: Text(
      //   'data',
      //   style: TextStyle(color: Colors.black),
      // ),
    );
  }
}
