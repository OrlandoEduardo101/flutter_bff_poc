import 'dart:convert';

class DsModel {
  final String widgetId;
  final String title;
  final String route;
  final List<DsModel> widgetList;

  const DsModel({
    this.widgetId = '',
    this.title= '',
    this.route= '',
    this.widgetList = const [],
  });

  DsModel copyWith({
    String? widgetId,
    String? title,
    String? route,
    List<DsModel>? widgetList,
  }) {
    return DsModel(
      widgetId: widgetId ?? this.widgetId,
      title: title ?? this.title,
      route: route ?? this.route,
      widgetList: widgetList ?? this.widgetList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'widgetId': widgetId,
      'title': title,
      'route': route,
      'widgetList': widgetList.map((x) => x.toMap()).toList(),
    };
  }

  factory DsModel.fromMap(Map<String, dynamic> map) {
    return DsModel(
      widgetId: map['widgetId'] ?? '',
      title: map['title'] ?? '',
      route: map['route'] ?? '',
      widgetList: List<DsModel>.from(map['widgetList']?.map((x) => DsModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DsModel.fromJson(String source) => DsModel.fromMap(json.decode(source));
}
