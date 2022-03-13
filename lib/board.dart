// ignore_for_file: prefer_const_constructors, prefer_conditional_assignment, unnecessary_null_comparison, deprecated_member_use, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:puzz_app/widgets/grid.dart';
import 'package:puzz_app/widgets/menu.dart';
import 'package:puzz_app/widgets/mytitle.dart';

// ignore: use_key_in_widget_constructors
class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> with TickerProviderStateMixin {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  bool _value1 = true;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  static const duration = Duration(seconds: 1);
  bool isActive = false;
  int secondsPassed = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        startTime();
      });
    }
    return SafeArea(
      // ignore: sized_box_for_whitespace
      child: Container(
        height: size.height,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: _animation,
              child: const Padding(
                  padding: EdgeInsets.all(5), child: FlutterLogo()),
            ),
            MyTitle(size),
            Grid(numbers, size, clickGrid),
            Menu(reset, move, secondsPassed, size),
          ],
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
      });
    }
    seeWin();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed += 1;
      });
    }
  }

  bool isSorted(List list) {
    int shw = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int jmp = list[i];
      if (shw > jmp) return false;
      shw = jmp;
    }
    return true;
  }

  void seeWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "You Win!!!",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "End",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        color: Colors.lightGreen,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
