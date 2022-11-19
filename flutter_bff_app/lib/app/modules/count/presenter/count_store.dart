import 'package:flutter_bff_app/app/modules/count/domain/decrement_usecase.dart';
import 'package:flutter_bff_app/app/modules/count/domain/increment_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CountStore extends StreamStore<Exception, int> {
  CountStore(this._incrementUsecase, this._decrementUsecase) : super(0);

  final IIncrementUsecase _incrementUsecase;
  final IDecrementUsecase _decrementUsecase;

  void incrementCount() {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 100));
    final result = _incrementUsecase(state);
    update(result);
  }

  void decrementCount() {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 100));
    final result = _decrementUsecase(state);
    update(result);
  }
}
