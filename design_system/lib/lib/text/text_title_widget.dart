import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ));
  }
}