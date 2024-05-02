import 'dart:convert';

import 'package:flutter/material.dart';

class LabelChip extends StatelessWidget {
  final String label;
  final Icon leadingIcon;

  const LabelChip({super.key, required this.label, required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Chip(
        padding: const EdgeInsets.all(2),
        label: Text(label),
        avatar: leadingIcon,
        visualDensity: VisualDensity.compact,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
