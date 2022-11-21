import 'dart:developer';

import 'package:design_system/design_system.dart';

import 'get_widgets_datasource.dart';

abstract class IGetWidgetsRepository {
  Future<DsModel> getDsModelList(String argRoute);
  Future<DsModel> sendText(String argRoute, String textBody);
}

class GetWidgetsRepository implements IGetWidgetsRepository {
  final IGetWidgetsDatasource datasource;

  GetWidgetsRepository(this.datasource);
  @override
  Future<DsModel> getDsModelList(String argRoute) async {
    try {
      final response = await datasource.getDsModelList(argRoute);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<DsModel> sendText(String argRoute, String textBody) async {
    try {
      final response = await datasource.sendText(argRoute, textBody);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
