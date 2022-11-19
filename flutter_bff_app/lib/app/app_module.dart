import 'package:flutter_bff_app/app/modules/count/count_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'modules/blank/blank_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<Uno>((i) => Uno()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/blankPage/', module: BlankModule()),
    ModuleRoute('/count/', module: CountModule()),
  ];

}