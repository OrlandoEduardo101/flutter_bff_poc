import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bff_app/app/count/count_store.dart';
 
void main() {
  late CountStore store;

  setUpAll(() {
    store = CountStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}