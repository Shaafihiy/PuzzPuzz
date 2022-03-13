// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:puzz_app/widgets/resetbutton.dart';
import 'package:puzz_app/widgets/time.dart';
import 'package:puzz_app/widgets/transfer.dart';

class Menu extends StatelessWidget {
  final VoidCallback? reset;
  int move;
  int secondsPassed;
  var size;
  // ignore: use_key_in_widget_constructors
  Menu(this.reset, this.move, this.secondsPassed, this.size);
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ResetButton(reset),
            Move(move),
            Time(secondsPassed)
          ],
        ));
  }
}
