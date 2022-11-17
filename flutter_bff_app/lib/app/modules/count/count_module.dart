import 'count_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'count_store.dart';

class CountModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CountStore()),
  ];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => const CountPage()),];
}