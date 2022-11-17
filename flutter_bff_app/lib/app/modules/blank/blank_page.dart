import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      store.fetchItens(widget.dsModel.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<BlankStore, Exception, DsModel>(
        store: store,
        onLoading: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
        onError: (context, error) => const Center(
              child: Text(
                'error',
                style: TextStyle(color: Colors.red),
              ),
            ),
        onState: (context, state) {
          return PageBase(
              body: List.generate(
            state.widgetList.length,
            (index) => Center(
              child: WidgetResolver(
                  widgetKey: state.widgetList[index].widgetId,
                  key: Key('${state.widgetList[index].widgetId}-$index'),
                  dsModel: state.widgetList[index],
                  onPressedButton: () {
                    if (state.widgetList[index].widgetId.contains('navButton')) {
                      Modular.to.pushNamed(
                        state.widgetList[index].route,
                        arguments: state.widgetList[index],
                      );
                    }

                    if (state.widgetList[index].widgetId.contains('navBlankButton')) {
                      Modular.to.pushNamed(
                        '/blankPage/',
                        arguments: state.widgetList[index],
                      );
                    }
                  }),
            ),
          ));
        });
  }
}
