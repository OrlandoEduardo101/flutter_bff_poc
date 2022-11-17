import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../blank/blank_store.dart';

class BlankPage extends StatefulWidget {
  final String title;
  final DsModel dsModel;
  const BlankPage({
    Key? key,
    this.title = 'BlankPage',
    required this.dsModel,
  }) : super(key: key);
  @override
  BlankPageState createState() => BlankPageState();
}

class BlankPageState extends State<BlankPage> {
  final BlankStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return PageBase(
        body: List.generate(
      widget.dsModel.widgetList.length,
      (index) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: WidgetResolver(
            widgetKey: widget.dsModel.widgetList[index].widgetId,
            key:  Key('${widget.dsModel.widgetList[index].widgetId}-$index'),
            dsModel: widget.dsModel.widgetList[index],
            onPressedButton: widget.dsModel.widgetList[index].widgetId.contains('navButton')
                ? () {
                    Modular.to.pushNamed(
                      widget.dsModel.widgetList[index].route,
                      arguments: widget.dsModel.widgetList[index],
                    );
                  }
                : null,
          ),
        ),
      ),
    ));
  }
}
