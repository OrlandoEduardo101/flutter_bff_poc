import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    String? title,
  }) : super(
          key: key,
          title: Text(title ?? ''),
        );
}
