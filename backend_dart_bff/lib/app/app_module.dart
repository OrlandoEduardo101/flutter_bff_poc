import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'bff_module/bff_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        Route.get('/', () => Response.ok('OK!')),
        Route.module('/bffModule', module: BffModule()),
      ];
}