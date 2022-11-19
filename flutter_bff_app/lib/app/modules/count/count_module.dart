
import 'package:flutter_bff_app/app/modules/count/domain/increment_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/decrement_usecase.dart';
import 'presenter/count_page.dart';
import 'presenter/count_store.dart';

class CountModule extends Module {
  @override
  final List<Bind> binds = [
    //domain
    Bind.factory((i) => IncrementUsecase()),
    Bind.factory((i) => DecrementUsecase()),

    //presenter
    Bind.lazySingleton((i) => CountStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => CountPage(store: context.read<CountStore>()),
    ),
  ];
}
