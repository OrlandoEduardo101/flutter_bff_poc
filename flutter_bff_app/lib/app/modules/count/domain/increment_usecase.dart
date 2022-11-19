abstract class IIncrementUsecase {
  int call(int value);
}

class IncrementUsecase implements IIncrementUsecase {
  @override
  int call(int value) {
    return value + 1;
  }
}
