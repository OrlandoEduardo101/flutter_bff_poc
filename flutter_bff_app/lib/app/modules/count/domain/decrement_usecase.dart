abstract class IDecrementUsecase {
  int call(int value);
}

class DecrementUsecase implements IDecrementUsecase {
  @override
  int call(int value) {
    return value - 1;
  }
}
