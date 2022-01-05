// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';

class TopSection extends StatefulWidget {
  TopSection({
    Key? key,
    required this.username,
    required this.allTask,
    required this.inProgress,
    required this.completed,
  }) : super(key: key);

  String username;
  String allTask;
  String inProgress;
  String completed;

  @override
  _TopSectionState createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Palette.primary,
            Color(0xB30070C0),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, ${widget.username}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          divide4,
          Text(
            now.toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Palette.secondary,
            ),
          ),
          divide40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    _addZero(digit: widget.allTask),
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      color: Palette.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Tasks',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    _addZero(digit: widget.inProgress),
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      color: Palette.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Taks',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'In Progress',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    _addZero(digit: widget.completed),
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      color: Palette.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tasks',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Completed',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          divide20,
        ],
      ),
    );
  }

  String _addZero({required String digit}) {
    if (digit.length == 1) {
      return '0${digit}';
    } else {
      return digit;
    }
  }
}
