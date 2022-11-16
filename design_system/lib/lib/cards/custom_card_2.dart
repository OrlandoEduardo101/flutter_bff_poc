import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    Key? key,
    required this.title,
  }) : super(
          key: key,
        );
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      color: Colors.green,
      child: Text(title),
    );
  }
}
