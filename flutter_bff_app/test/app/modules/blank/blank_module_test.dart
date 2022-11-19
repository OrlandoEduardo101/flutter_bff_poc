import "dart:convert";

import "package:design_system/design_system.dart";
import "package:flutter_bff_app/app/app_module.dart";
import "package:flutter_bff_app/app/modules/blank/blank_module.dart";
import "package:flutter_bff_app/app/modules/blank/blank_store.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:modular_test/modular_test.dart";
import "package:uno/uno.dart";

class UnoMock extends Mock implements Uno {}

class RequestMock extends Mock implements Request {}

main() {
  final uno = UnoMock();
  setUpAll(() {});
  initModule(AppModule(), replaceBinds: [
    Bind.lazySingleton<Uno>((i) => uno),
  ]);
  initModule(BlankModule(), replaceBinds: [
    // Bind.lazySingleton<Uno>((i) => uno),
  ]);
  test("Must recover service without error", () {
    final service = Modular.get<BlankStore>();
    expect(service, isA<BlankStore>());
  });

  test("Must return DsModel", () async {
    when(() => uno.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(resultList),
          status: 200,
          headers: {},
          request: RequestMock(),
        ));
    final store = Modular.get<BlankStore>();
    await store.fetchItens("teste");
    expect(store.state, isA<DsModel>());
    expect(store.state.pageName, equals("page 1"));
  });
}

const String resultList =
    '''{
  "page_name": "page 1",
  "widget_list": [
    {"widgetId": "appBar", "title": "appBar page 1"},
    {"widgetId": "card1", "title": "texto texto card 1"},
    {"widgetId": "card2", "title": "texto texto card 2"},
    {"widgetId": "card3", "title": "texto texto card 3"},
    {
      "widgetId": "navButton",
      "title": "new blank page",
      "route": "/blankPage/",
      "page_name": "page 1 b",
      "widget_list": [
        {"widgetId": "appBar", "title": "appBar page 2 b", "padding_vertical": 16},
        {"widgetId": "sizedBox", "padding_vertical": 8, "padding_horizontal": 16},
        {"widgetId": "card1", "title": "texto texto card 1"},
        {"widgetId": "sizedBox", "padding_vertical": 8},
        {"widgetId": "navButton", "title": "homePage", "route": "/count"},
        {
          "widgetId": "row",
          "widget_list": [
            {"padding_vertical": 8, "padding_horizontal": 16, "widgetId": "card1", "title": "texto texto row card 1"},
            {"padding_vertical": 8, "padding_horizontal": 16, "widgetId": "card1", "title": "texto texto row card 2"},
            {"padding_vertical": 8, "padding_horizontal": 16, "widgetId": "card1", "title": "texto texto row card 3"}
          ]
        }
      ]
    }
  ]
}''';
