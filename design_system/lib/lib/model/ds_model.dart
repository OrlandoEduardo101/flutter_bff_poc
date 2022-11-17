import 'dart:convert';

class DsModel {
  final String widgetId;
  final String title;
  final String route;
  final String pageName;
  final List<DsModel> widgetList;

  const DsModel({
    this.widgetId = '',
    this.title= '',
    this.route= '',
    this.pageName= '',
    this.widgetList = const [],
  });

  DsModel copyWith({
    String? widgetId,
    String? title,
    String? route,
    String? pageName,
    List<DsModel>? widgetList,
  }) {
    return DsModel(
      widgetId: widgetId ?? this.widgetId,
      title: title ?? this.title,
      route: route ?? this.route,
      pageName: pageName ?? this.pageName,
      widgetList: widgetList ?? this.widgetList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'widgetId': widgetId,
      'title': title,
      'route': route,
      'page_name': pageName,
      'widget_list': widgetList.map((x) => x.toMap()).toList(),
    };
  }

  factory DsModel.fromMap(Map<String, dynamic> map) {
    return DsModel(
      widgetId: map['widgetId'] ?? '',
      title: map['title'] ?? '',
      route: map['route'] ?? '',
      pageName: map['page_name'] ?? '',
      widgetList: map['widget_list'] != null ? List<DsModel>.from(map['widget_list']?.map((x) => DsModel.fromMap(x))) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DsModel.fromJson(String source) => DsModel.fromMap(json.decode(source));
}
