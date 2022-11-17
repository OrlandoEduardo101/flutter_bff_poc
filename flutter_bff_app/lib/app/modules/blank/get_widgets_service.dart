import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:uno/uno.dart';

class GetWidgetsService {
  final Uno httpClient;

  GetWidgetsService(this.httpClient);
  Future<DsModel> getDsModelList(String argRoute) async {
    try {
      final response = await httpClient.get('http://127.0.0.1:3001/bffModule/$argRoute');
      return DsModel.fromMap(response.data);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
