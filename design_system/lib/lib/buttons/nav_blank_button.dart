import 'package:flutter/material.dart';

class NavBlankButton extends StatelessWidget {
  const NavBlankButton({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
