import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageBase extends StatelessWidget {
  const PageBase({
    Key? key,
    this.appBar,
    required this.body,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ListView(
        shrinkWrap: true,
        children: body,
      ),
    );
  }
}
