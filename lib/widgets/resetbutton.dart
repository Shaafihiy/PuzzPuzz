// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback? reset;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ResetButton(this.reset);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        // ignore: prefer_const_constructors
        child: Text('Reset'),
        onPressed: reset,
        color: Colors.purpleAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)));
  }
}
