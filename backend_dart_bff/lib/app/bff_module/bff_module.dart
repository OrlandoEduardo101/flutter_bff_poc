import 'package:backend_dart_bff/app/bff_module/presenter/bff_controller.dart';
import 'package:backend_dart_bff/app/bff_module/presenter/bff_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class BffModule extends Module {

  @override
  List<Bind> get binds => [
        //presenter
        Bind.scoped((i) => BffController()),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.resource(BffResource()),
      ];
}