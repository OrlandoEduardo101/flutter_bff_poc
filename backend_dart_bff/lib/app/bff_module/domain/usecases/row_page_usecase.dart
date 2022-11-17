import 'package:backend_dart_bff/app/shared/either/either.dart';

import '../entities/bff_arguments_entity.dart';
import '../entities/bff_entity.dart';
import '../errors/errors.dart';

abstract class IRowPageUsecase {
  Future<Either<DomainError, BffEntity>> call(BffArgumentsEntity args);
}

class RowPageUsecase extends IRowPageUsecase {
  @override
  Future<Either<DomainError, BffEntity>> call(BffArgumentsEntity args) async {
    return right(BffEntity(pageName: 'Row Page', widgetList: [
      BffEntity(
        widgetId: 'appBar',
        title: 'appBar page 2 b',
        paddingVertical: 16,
      ),
      BffEntity(
        widgetId: 'sizedBox',
        paddingVertical: 8,
        paddingHorizontal: 16,
      ),
      BffEntity(
        widgetId: 'card1',
        title: 'texto texto card 1',
      ),
      BffEntity(
        widgetId: 'sizedBox',
        paddingVertical: 8,
      ),
      BffEntity(
        widgetId: 'navButton',
        title: 'homePage',
        route: '/count',
      ),
      BffEntity(widgetId: 'row', widgetList: [
        BffEntity(
          paddingVertical: 8,
          paddingHorizontal: 16,
          widgetId: 'card1',
          title: 'texto texto row card 1',
        ),
        BffEntity(
          paddingVertical: 8,
          paddingHorizontal: 16,
          widgetId: 'card1',
          title: 'texto texto row card 2',
        ),
        BffEntity(
          paddingVertical: 8,
          paddingHorizontal: 16,
          widgetId: 'card1',
          title: 'texto texto row card 3',
        ),
      ]),
    ]));
  }
}
/*
jsonEncode([
      {
        'page_name': 'page 1',
        'widget_list': [
          {
            'widgetId': 'appBar',
            'title': 'appBar page 1',
          },
          {
            'widgetId': 'card1',
            'title': 'texto texto card 1',
          },
          {
            'widgetId': 'card2',
            'title': 'texto texto card 2',
          },
          {
            'widgetId': 'card3',
            'title': 'texto texto card 3',
          },
          {
            'widgetId': 'navButton',
            'title': 'new blank page',
            'route': '/blankPage/',
            'page_name': 'page 1 b',
            'widget_list': [
              {'widgetId': 'appBar', 'title': 'appBar page 2 b', 'padding_vertical': 16},
              {
                'widgetId': 'sizedBox',
                'padding_vertical': 8,
                'padding_horizontal': 16,
              },
              {
                'widgetId': 'card1',
                'title': 'texto texto card 1',
              },
              {
                'widgetId': 'sizedBox',
                'padding_vertical': 8,
              },
              {
                'widgetId': 'navButton',
                'title': 'homePage',
                'route': '/count',
              },
              {
                'widgetId': 'row',
                'widget_list': [
                  {
                    'padding_vertical': 8,
                    'padding_horizontal': 16,
                    'widgetId': 'card1',
                    'title': 'texto texto row card 1',
                  },
                  {
                    'padding_vertical': 8,
                    'padding_horizontal': 16,
                    'widgetId': 'card1',
                    'title': 'texto texto row card 2',
                  },
                  {
                    'padding_vertical': 8,
                    'padding_horizontal': 16,
                    'widgetId': 'card1',
                    'title': 'texto texto row card 3',
                  },
                ]
              },
            ]
          },
        ]
      },
      {
        'page_name': 'page 2',
        'widget_list': [
          {
            'widgetId': 'appBar',
            'title': 'appBar page 2',
          },
          {
            'widgetId': 'card1',
            'title': 'texto texto card 1',
          },
          {
            'widgetId': 'card2',
            'title': 'texto texto card 2',
          },
          {
            'widgetId': 'card3',
            'title': 'texto texto card 3',
          },
          {
            'widgetId': 'navButton',
            'title': 'new blank page',
            'page_name': 'page 2 b',
            'route': '/blankPage/',
            'widget_list': [
              {
                'widgetId': 'appBar',
                'title': 'appBar page 2 b',
              },
              {
                'widgetId': 'card1',
                'title': 'texto texto card 1',
              },
              {
                'widgetId': 'navButton',
                'title': 'homePage',
                'route': '/count',
              },
            ]
          },
        ]
      },
      {
        'page_name': 'page 3',
        'widget_list': [
          {
            'widgetId': 'appBar',
            'title': 'appBar page 3',
          },
          {
            'widgetId': 'card1',
            'title': 'texto texto card 1',
          },
          {
            'widgetId': 'card2',
            'title': 'texto texto card 2',
          },
          {
            'widgetId': 'card3',
            'title': 'texto texto card 3',
          },
          {
            'widgetId': 'navButton',
            'title': 'new blank page',
            'route': '/blankPage/',
            'page_name': 'page 3 b',
            'widget_list': [
              {
                'widgetId': 'appBar',
                'title': 'appBar page 3b',
              },
              {
                'widgetId': 'card1',
                'title': 'texto texto card 1',
              },
              {
                'widgetId': 'navButton',
                'title': 'homePage',
                'route': '/count',
              },
            ]
          },
        ]
      },
      {
        'page_name': 'page 4',
        'widget_list': [
          {
            'widgetId': 'appBar',
            'title': 'appBar page 4',
          },
          {
            'widgetId': 'card1',
            'title': 'texto texto card 1',
          },
          {
            'widgetId': 'card2',
            'title': 'texto texto card 2',
          },
          {
            'widgetId': 'card3',
            'title': 'texto texto card 3',
          },
          {
            'page_name': 'page 4 b',
            'widgetId': 'navButton',
            'title': 'new blank page',
            'route': '/blankPage/',
            'widget_list': [
              {
                'widgetId': 'appBar',
                'title': 'appBar page 4 b',
              },
              {
                'widgetId': 'card1',
                'title': 'texto texto card 1',
              },
              {
                'widgetId': 'navButton',
                'title': 'homePage',
                'route': '/count',
              },
            ]
          },
        ]
      },
      {
        'page_name': 'page 5',
        'widget_list': [
          {
            'widgetId': 'appBar',
            'title': 'appBar page 5',
          },
          {
            'widgetId': 'card1',
            'title': 'texto texto card 1',
          },
          {
            'widgetId': 'card2',
            'title': 'texto texto card 2',
          },
          {
            'widgetId': 'card3',
            'title': 'texto texto card 3',
          },
          {
            'widgetId': 'navButton',
            'title': 'new blank page',
            'route': '/blankPage/',
            'page_name': 'page 5 b',
            'widget_list': [
              {
                'widgetId': 'appBar',
                'title': 'appBar page 5 b',
              },
              {
                'widgetId': 'card1',
                'title': 'texto texto card 1',
              },
              {
                'widgetId': 'navButton',
                'title': 'homePage',
                'route': '/count',
              },
            ]
          },
        ]
      }
    ])
    */