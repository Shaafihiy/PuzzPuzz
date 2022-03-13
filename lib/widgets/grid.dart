import 'package:flutter/material.dart';
import 'package:puzz_app/widgets/gridbutton.dart';

// ignore: must_be_immutable
class Grid extends StatelessWidget {
  var numbers = [];
  // ignore: prefer_typing_uninitialized_variables
  var size;
  Function clickGrid;
  // ignore: use_key_in_widget_constructors
  Grid(this.numbers, this.size, this.clickGrid);

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    // ignore: sized_box_for_whitespace
    return Container(
      height: height * 0.75,
      child: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(1.0),
        child: GridView.builder(
          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton("${numbers[index]}", () {
                    clickGrid(index);
                  })
                // ignore: prefer_const_constructors
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
