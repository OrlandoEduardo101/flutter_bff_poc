import 'dart:async';

import 'package:backend_dart_bff/app/bff_module/presenter/bff_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class BffResource implements Resource {
  @override
  List<Route> get routes => [
        Route.get('/',(ModularArguments args, Request request) => returnBffScreen(args, request)),
      ];

  FutureOr<Response> returnBffScreen(ModularArguments args, Request request) =>
      Modular.get<BffController>().returnBffScreen(args, request);
}
