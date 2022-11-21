import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, this.onFieldSubmitted});
  final void Function(String value)? onFieldSubmitted;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}