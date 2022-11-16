import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class BffController {
  Future<Response> returnBffScreen(ModularArguments args, Request request) async {
    return Response.ok([
      {
        'widget_list': [
          {
            'id': 'card1',
            'title': 'texto texto card 1',
          },
          {
            'id': 'card2',
            'title': 'texto texto card 2',
          },
          {
            'id': 'card3',
            'title': 'texto texto card 3',
          },
          {
            'id': 'navButton',
            'title': 'new blank page',
            'route': '/blankPage',
            'widget_list': [
              {
                'id': 'card1',
                'title': 'texto texto card 1',
              },
              {
                'id': 'navButton',
                'title': 'homePage',
                'route': '/blankPage',
              },
            ]
          },
        ]
      }
    ]);
  }
}
