// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final VoidCallback? click;
  final String text;
  // ignore: prefer_const_constructors_in_immutables
  GridButton(this.text, this.click, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return RaisedButton(
      child: Text(
        text,
        // ignore: prefer_const_constructors
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Colors.yellowAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: click,
    );
  }
}
