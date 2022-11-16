import 'package:flutter/material.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
    Key? key,
    required this.title,
  }) : super(
          key: key,
        );
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      color: Colors.amber,
      child: Text(title),
    );
  }
}
