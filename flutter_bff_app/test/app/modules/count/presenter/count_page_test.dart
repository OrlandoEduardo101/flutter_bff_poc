import 'package:flutter/material.dart';
import 'package:flutter_bff_app/app/modules/count/presenter/count_page.dart';
import 'package:flutter_bff_app/app/modules/count/presenter/count_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_test/triple_test.dart';

class MockCounterStore extends MockStore<Exception, int> implements CountStore {}

void main() {
  final mock = MockCounterStore();

  testWidgets('Must update count state', (tester) async {
    whenObserve<Exception, int>(
      mock,
      input: () => mock.incrementCount(),
      initialState: 0,
      triples: [
        Triple(state: 1),
        Triple(isLoading: true, event: TripleEvent.loading, state: 1),
        Triple(state: 2),
      ],
    );

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
            home: CountPage(
          store: mock,
        )));

    await tester.pumpWidget(testWidget);

    final titleFinder = find.text('${mock.state}');
    expect(titleFinder, findsOneWidget);
  });
}
