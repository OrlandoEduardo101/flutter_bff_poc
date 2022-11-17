
import 'package:flutter_modular/flutter_modular.dart';

import 'blank_page.dart';
import 'blank_store.dart';

class BlankModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BlankStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BlankPage(
      dsModel: args.data  ?? []
    )),
  ];
}
