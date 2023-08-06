import 'package:flutter/material.dart';
import 'package:build_manager/ui/router/app_routes.dart';
import 'package:build_manager/ui/pages/error_404_page/error_404_page.dart';

class AppRouter {
  static const _pageDuration = Duration(milliseconds: 800);
  static String get initRoute => AppRoutes.start;

  static Route generate(RouteSettings settings) {
    final routeName = settings.name?.trim();

    if (routeName == null) return _errorRoute404;

    final allAppRoutes = AppRoutes.routes.toList();

    for (AppRoute appRoute in allAppRoutes) {
      if (routeName != appRoute.path) continue;

      final newRoute = _getRouteTemplate(
        child: appRoute.page,
        settings: settings,
      );

      return newRoute;
    }

    return _errorRoute404;
  }

  static Route _getRouteTemplate({
    required Widget child,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      transitionDuration: _pageDuration,
      reverseTransitionDuration: _pageDuration,
      pageBuilder: (_, __, ___) => child,
    );
  }

  static final Route _errorRoute404 = MaterialPageRoute(
    settings: const RouteSettings(name: '/404'),
    builder: (_) => const Error404Page(),
  );
}
