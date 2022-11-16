import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bff_app/app/blank/blank_store.dart';
 
void main() {
  late BlankStore store;

  setUpAll(() {
    store = BlankStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}