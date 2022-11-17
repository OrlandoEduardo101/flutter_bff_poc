
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'blank_page.dart';
import 'blank_store.dart';
import 'get_widgets_service.dart';

class BlankModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => GetWidgetsService(i())),
    Bind.factory((i) => BlankStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BlankPage(
      dsModel: args.data  ?? const DsModel()
    )),
  ];
}
