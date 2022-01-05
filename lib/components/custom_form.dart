import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  CustomForm({
    Key? key,
    this.children,
  }) : super(key: key);

  List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 45),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffE9F3FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: children ??
            [
              Container(),
            ],
      ),
    );
  }
}
