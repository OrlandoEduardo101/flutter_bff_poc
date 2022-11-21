import 'dart:convert';

import '../../domain/entities/bff_entity.dart';

class BffModel extends BffEntity {
  const BffModel({
    super.widgetId = '',
    super.title = '',
    super.route = '',
    super.pageName = '',
    super.paddingHorizontal = 0,
    super.paddingVertical = 0,
    super.getWidgetsInPage = true,
    super.widgetList = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'widgetId': widgetId,
      'title': title,
      'route': route,
      'page_name': pageName,
      'padding_vertical': paddingVertical,
      'padding_horizontal': paddingHorizontal,
      'get_widgets_in_page': getWidgetsInPage,
      'widget_list': widgetList.map((x) => (BffModel.from(x)).toMap()).toList(),
    };
  }

  factory BffModel.fromMap(Map<String, dynamic> map) {
    return BffModel(
      widgetId: map['widgetId'] ?? '',
      title: map['title'] ?? '',
      route: map['route'] ?? '',
      pageName: map['page_name'] ?? '',
      getWidgetsInPage: map['get_widgets_in_page'] ?? '',
      paddingHorizontal: double.tryParse('${map['padding_horizontal']}') ?? 0.0,
      paddingVertical: double.tryParse('${map['padding_vertical']}') ?? 0.0,
      widgetList:
          map['widget_list'] != null ? List<BffModel>.from(map['widget_list']?.map((x) => BffModel.fromMap(x))) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory BffModel.fromJson(String source) => BffModel.fromMap(json.decode(source));

  factory BffModel.from(BffEntity source) => BffModel(
        paddingHorizontal: source.paddingHorizontal,
        paddingVertical: source.paddingVertical,
        pageName: source.pageName,
        route: source.route,
        title: source.title,
        widgetId: source.widgetId,
        widgetList: source.widgetList,
        getWidgetsInPage: source.getWidgetsInPage,
      );
}
