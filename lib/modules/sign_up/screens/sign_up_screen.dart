// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/components/custom_textfield.dart';
import 'package:my_task/components/rounded_button.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';
import 'package:my_task/helpers/db.helper.dart';
import 'package:my_task/models/User.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
      backgroundColor: Colors.white,
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

  Widget _buildBody(BuildContext context) {
    DBHelper dbHelper = DBHelper();

    TextEditingController _username = TextEditingController();
    TextEditingController _fullName = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            // flex: 2,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My',
                      style: GoogleFonts.sen(
                        color: Colors.black,
                        fontSize: 72,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'TASK',
                      style: GoogleFonts.sen(
                        color: Palette.primary,
                        fontSize: 72,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Make your time management more easier',
                  style: GoogleFonts.sen(
                    fontSize: 14,
                    color: Palette.placeholder,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomTextField(
                hintText: 'Enter your username',
                onChanged: (val) {
                  _username.text = val;
                },
              ),
              divide20,
              CustomTextField(
                hintText: 'Enter your full name',
                onChanged: (val) {
                  _fullName.text = val;
                },
              ),
              divide20,
              CustomTextField(
                hintText: 'Enter your password',
                isPassword: true,
                onChanged: (val) {
                  _password.text = val;
                },
              ),
              divide48,
              RoundedButton(
                text: 'Sign Up',
                onPressed: () async {
                  final db = await dbHelper.initDB();

                  final username = _username.text;
                  final fullName = _fullName.text;
                  final password = _password.text;

                  db.rawInsert(
                    "INSERT INTO Users (username, fullName, password) VALUES ('$username', '$fullName', '$password')",
                  );

                  Fluttertoast.showToast(
                    msg: 'Register Successful',
                    textColor: Colors.white,
                    backgroundColor: Colors.green,
                  );
                },
              ),
              divide20,
            ],
          )
        ],
      ),
    );
  }
}
