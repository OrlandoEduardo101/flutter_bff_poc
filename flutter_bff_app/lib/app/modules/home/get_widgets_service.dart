import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:uno/uno.dart';

class GetWidgetsService {
  final Uno httpClient;

  GetWidgetsService(this.httpClient);
  Future<List<DsModel>> getDsModelList() async {
    try {
      final response = await httpClient.get('http://127.0.0.1:3002/bffModule/');
      final responseList = List.from(response.data).map((e) => DsModel.fromMap(e)).toList();
      return responseList;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
