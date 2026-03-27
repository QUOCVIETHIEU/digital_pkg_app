import '../../core/constants/app_route.dart';

class DrawerModel {
  DrawerModel({
    required this.route,
    required this.title,
    required this.icon,
    this.children = const [],
    this.enabled = true,
  });

  final String title;
  final String icon;
  final List<DrawerModel> children;
  final AppRoute route;
  final bool enabled;

  DrawerModel copyWith({
    String? title,
    String? icon,
    List<DrawerModel>? children,
    AppRoute? route,
    bool? enabled,
  }) {
    return DrawerModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      children: children ?? this.children,
      route: route ?? this.route,
      enabled: enabled ?? this.enabled,
    );
  }
}
