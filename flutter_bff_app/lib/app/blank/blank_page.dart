import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bff_app/app/blank/blank_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BlankPage extends StatefulWidget {
  final String title;
  final List<DsModel> listDsModel;
  const BlankPage({Key? key, this.title = 'BlankPage', required this.listDsModel}) : super(key: key);
  @override
  BlankPageState createState() => BlankPageState();
}

class BlankPageState extends State<BlankPage> {
  final BlankStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return PageBase(
        body: List.generate(
      widget.listDsModel.length,
      (index) => WidgetResolver(
        widgetKey: '${widget.listDsModel[index].widgetId}-$index',
        dsModel: widget.listDsModel[index],
        onPressedButton: widget.listDsModel[index].widgetId.contains('navButton')
            ? () {
                Modular.to.pushNamed(
                  widget.listDsModel[index].route,
                  arguments: widget.listDsModel[index].widgetList,
                );
              }
            : null,
      ),
    ));
  }
}
