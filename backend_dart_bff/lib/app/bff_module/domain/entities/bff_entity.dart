import 'dart:convert';

class BffEntity {
  final String widgetId;
  final String title;
  final String route;
  final String pageName;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool getWidgetsInPage;
  final List<BffEntity> widgetList;

  const BffEntity({
    this.widgetId = '',
    this.title = '',
    this.route = '',
    this.pageName = '',
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
    this.getWidgetsInPage = true,
    this.widgetList = const [],
  });

  BffEntity copyWith({
    String? widgetId,
    String? title,
    String? route,
    String? pageName,
    double? paddingHorizontal,
    double? paddingVertical,
    bool? getWidgetsInPage,
    List<BffEntity>? widgetList,
  }) {
    return BffEntity(
      widgetId: widgetId ?? this.widgetId,
      title: title ?? this.title,
      route: route ?? this.route,
      pageName: pageName ?? this.pageName,
      widgetList: widgetList ?? this.widgetList,
      paddingHorizontal: paddingHorizontal ?? this.paddingHorizontal,
      paddingVertical: paddingVertical ?? this.paddingVertical,
      getWidgetsInPage: getWidgetsInPage ?? this.getWidgetsInPage,
    );
  }
}
