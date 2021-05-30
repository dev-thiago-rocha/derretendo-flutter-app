import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  Widget field = TextField(
    obscureText: false,
    controller: controller,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  @override
  Widget build(BuildContext context) {
    return field;
  }
}
