import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Time extends StatelessWidget {
  int secondsPassed;
  // ignore: use_key_in_widget_constructors
  Time(this.secondsPassed);
  @override
  Widget build(BuildContext context) {
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.only(top: 12.0),
      child: Text(
        "Time: $secondsPassed",
        // ignore: prefer_const_constructors
        style: TextStyle(
            fontSize: 20,
            color: Colors.redAccent,
            decoration: TextDecoration.none),
      ),
    );
  }
}
