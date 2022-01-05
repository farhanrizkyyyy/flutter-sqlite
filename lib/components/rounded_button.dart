// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_task/configs/palette.config.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.width = double.infinity,
  }) : super(key: key);

  String text;
  bool isOutlined;
  double width;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Palette.primary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
