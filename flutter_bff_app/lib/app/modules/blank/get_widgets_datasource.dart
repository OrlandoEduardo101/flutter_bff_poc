import 'package:design_system/design_system.dart';
import 'package:uno/uno.dart';

abstract class IGetWidgetsDatasource {
  Future<DsModel> getDsModelList(String argRoute);
  Future<DsModel> sendText(String argRoute, String textBody);
}

class GetWidgetsDatasource implements IGetWidgetsDatasource {
  final Uno httpClient;

  GetWidgetsDatasource(this.httpClient);
  @override
  Future<DsModel> getDsModelList(String argRoute) async {
    final response = await httpClient.get('http://127.0.0.1:3001/bffModule/$argRoute');
    return DsModel.fromMap(response.data);
  }

  @override
  Future<DsModel> sendText(String argRoute, String textBody) async {
    final response = await httpClient.post('http://127.0.0.1:3001/bffModule/$argRoute', data: {
      'text': textBody,
    });
    return DsModel.fromMap(response.data);
  }
}
