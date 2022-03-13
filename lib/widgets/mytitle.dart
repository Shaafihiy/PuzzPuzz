// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var size;

  // ignore: use_key_in_widget_constructors
  MyTitle(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.08,
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(8.0),
      child: Text(
        "PuzzPuzz",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.05,
            color: Colors.orangeAccent,
            decoration: TextDecoration.none),
      ),
    );
  }
}
