import 'package:flutter_bff_app/app/blank/blank_Page.dart';
import 'package:flutter_bff_app/app/blank/blank_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BlankModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BlankStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BlankPage()),
  ];
}
