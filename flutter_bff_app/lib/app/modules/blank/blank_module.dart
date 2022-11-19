import 'package:design_system/design_system.dart';
import 'package:flutter_bff_app/app/modules/blank/get_widgets_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'blank_page.dart';
import 'blank_store.dart';
import 'get_widgets_repository.dart';

class BlankModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<IGetWidgetsDatasource>((i) => GetWidgetsDatasource(i<Uno>())),
    Bind.factory<IGetWidgetsRepository>((i) => GetWidgetsRepository(i<IGetWidgetsDatasource>())),
    Bind.factory<BlankStore>((i) => BlankStore(i<IGetWidgetsRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BlankPage(dsModel: args.data ?? const DsModel())),
  ];
}
