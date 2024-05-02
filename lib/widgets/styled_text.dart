import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  const StyledText(this.text, {super.key, this.fontSize = 25});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
