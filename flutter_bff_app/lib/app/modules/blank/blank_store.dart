import 'package:design_system/design_system.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'get_widgets_service.dart';

class BlankStore extends NotifierStore<Exception, DsModel> {

  BlankStore(this._getWidgetsService) : super(const DsModel());

  final GetWidgetsService _getWidgetsService;

  Future<void> fetchItens(String argRoute) async {
    setLoading(true);

    final result = await _getWidgetsService.getDsModelList(argRoute);

    update(result);
    setLoading(false);
  }

}