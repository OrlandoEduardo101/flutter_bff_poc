import 'dart:async';

import 'package:backend_dart_bff/app/bff_module/presenter/bff_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class BffResource implements Resource {
  @override
  List<Route> get routes => [
        Route.get('/',(ModularArguments args, Request request) => returnSelectPage(args, request)),
        Route.get('/rowPage',(ModularArguments args, Request request) => returnRowPage(args, request)),
        Route.post('/sendText',(ModularArguments args, Request request) => sendText(args, request)),
      ];

  FutureOr<Response> returnSelectPage(ModularArguments args, Request request) =>
      Modular.get<BffController>().returnSelectPage(args, request);

  FutureOr<Response> returnRowPage(ModularArguments args, Request request) =>
      Modular.get<BffController>().returnRowPage(args, request);

  FutureOr<Response> sendText(ModularArguments args, Request request) =>
      Modular.get<BffController>().sendText(args, request);
}
