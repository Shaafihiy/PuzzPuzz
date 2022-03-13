// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class Move extends StatelessWidget {
  int move;

  Move(this.move);

  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.only(top: 12.0),
      child: Text(
        'Transfer: $move',
        style: TextStyle(
          color: Colors.amberAccent,
          decoration: TextDecoration.none,
          fontSize: 20,
        ),
      ),
    );
  }
}
