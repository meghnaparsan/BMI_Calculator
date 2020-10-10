import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function gestureFunction;

  Cards({@required this.color, @required this.cardChild, this.gestureFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureFunction,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
