import 'package:design_system/design_system.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'get_widgets_repository.dart';

class BlankStore extends NotifierStore<Exception, DsModel> {

  BlankStore(this._getWidgetsService) : super(const DsModel());

  final IGetWidgetsRepository _getWidgetsService;

  Future<void> fetchItens(String argRoute) async {
    setLoading(true);

    final result = await _getWidgetsService.getDsModelList(argRoute);

    update(result);
    setLoading(false);
  }

}