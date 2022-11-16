import 'package:flutter/material.dart';

class CustomCard3 extends StatelessWidget {
  const CustomCard3({
    Key? key,
    required this.title,
  }) : super(
          key: key,
        );
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text(title),
    );
  }
}
