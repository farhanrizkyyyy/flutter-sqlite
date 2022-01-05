// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_task/configs/palette.config.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.hintText = '',
    this.borderColor,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  String hintText;
  Color? borderColor;
  Widget? suffixIcon;
  bool isPassword;
  TextEditingController? controller;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        // vertical: 8,
        horizontal: 28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        border: Border.all(
          color: borderColor ?? Palette.placeholder,
          width: .8,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
          ),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
