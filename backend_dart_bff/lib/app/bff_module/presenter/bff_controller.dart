import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class BffController {
  Future<Response> returnBffScreen(ModularArguments args, Request request) async {
    return Response.ok([
      {
        'id_widget_list': [
          'card1',
          'card2',
          'card3',
        ]
      }
    ]);
  }
}
