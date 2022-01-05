// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/components/custom_textfield.dart';
import 'package:my_task/components/rounded_button.dart';
import 'package:my_task/configs/palette.config.dart';
import 'package:my_task/constant/divider.constant.dart';
import 'package:my_task/helpers/db.helper.dart';
import 'package:my_task/modules/home/screens/home_screen.dart';
import 'package:my_task/modules/sign_up/screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: _buildAppbar(),
      body: _buildBody(context),
      backgroundColor: Colors.white,
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Container(),
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    TextEditingController _username = TextEditingController();
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
                hintText: 'Enter your name',
                onChanged: (val) {
                  _username.text = val;
                },
              ),
              // divide20,
              // CustomTextField(
              //   hintText: 'Enter your password',
              //   isPassword: true,
              //   onChanged: (val) {
              //     _password.text = val;
              //   },
              // ),
              divide48,
              RoundedButton(
                text: 'Sign In',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        username: _username.text,
                      ),
                    ),
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
