import 'package:flutter_bff_app/app/modules/blank/get_widgets_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => HomePage(
              store: context.read<HomeStore>(),
            )),
  ];
}
