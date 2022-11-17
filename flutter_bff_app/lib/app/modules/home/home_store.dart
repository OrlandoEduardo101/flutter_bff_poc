import 'package:design_system/design_system.dart';
import 'package:flutter_bff_app/app/modules/home/get_widgets_service.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, List<DsModel>> {
  HomeStore(this._getWidgetsService) : super([]);

  final GetWidgetsService _getWidgetsService;

  Future<void> fetchItens() async {
    setLoading(true);

    final result = await _getWidgetsService.getDsModelList();

    update(result);
    setLoading(false);
  }
}
