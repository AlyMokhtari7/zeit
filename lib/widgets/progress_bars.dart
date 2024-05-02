import 'package:flutter/material.dart';

class LinearProgressBar extends StatelessWidget {
  final double indicatorValue;

  const LinearProgressBar({super.key, required this.indicatorValue});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: indicatorValue,
      minHeight: 5,
      // borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}
