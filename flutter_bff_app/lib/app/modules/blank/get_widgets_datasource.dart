import 'package:design_system/design_system.dart';
import 'package:uno/uno.dart';


abstract class IGetWidgetsDatasource {
  Future<DsModel> getDsModelList(String argRoute);
}

class GetWidgetsDatasource implements IGetWidgetsDatasource {
  final Uno httpClient;

  GetWidgetsDatasource(this.httpClient);
  @override
  Future<DsModel> getDsModelList(String argRoute) async {
    final response = await httpClient.get('http://127.0.0.1:3001/bffModule/$argRoute');
    return DsModel.fromMap(response.data);
  }
}
