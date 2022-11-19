import 'package:flutter_bff_app/app/modules/count/domain/decrement_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final IDecrementUsecase usecase = DecrementUsecase();
  test('Must return actual value - 1', () {
    final result = usecase(4);
    expect(result, equals(3));
  });
}
