import 'package:flutter_bff_app/app/modules/count/domain/decrement_usecase.dart';
import 'package:flutter_bff_app/app/modules/count/domain/increment_usecase.dart';
import 'package:flutter_bff_app/app/modules/count/presenter/count_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class MockIncrementUsecase extends Mock implements IIncrementUsecase {}

class MockDecrementUsecase extends Mock implements IDecrementUsecase {}

void main() {
  late final IIncrementUsecase incrementUsecase;
  late final IDecrementUsecase decrementUsecase;

  setUp(() {
    incrementUsecase = MockIncrementUsecase();
    decrementUsecase = MockDecrementUsecase();
  });
  storeTest<CountStore>('Must return loading true and update state at incrementCount',
      build: () {
        //Arrange
        when(() => incrementUsecase.call(any())).thenReturn(5);
        return CountStore(incrementUsecase, decrementUsecase);
      },
      //action
      act: (store) => store.incrementCount(),
      wait: const Duration(milliseconds: 600),
      //matcher
      expect: () => [
            tripleLoading,
            tripleState,
          ]);

  storeTest<CountStore>('Must return loading true and update state at decrementCount',
      build: () {
        //Arrange
        when(() => decrementUsecase.call(any())).thenReturn(5);
        return CountStore(incrementUsecase, decrementUsecase);
      },
      //action
      act: (store) => store.decrementCount(),
      wait: const Duration(milliseconds: 600),
      //matcher
      expect: () => [
            tripleLoading,
            tripleState,
          ]);
}
