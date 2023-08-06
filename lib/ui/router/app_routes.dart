import 'package:build_manager/ui/pages/auth/auth_page.dart';
import 'package:build_manager/ui/pages/home/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:build_manager/ui/pages/start/start_page.dart';


abstract class AppRoutes {
  const AppRoutes._();
  
  static const String start = '/';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String confirm = '/auth/confirm';

  static Set<AppRoute> get routes {
    const routesList = <AppRoute>[
      AppRoute(page: StartPage(), path: start),
      AppRoute(page: AuthPage(), path: auth),
      AppRoute(page: HomePage(), path: home),
    ];

    return routesList.toSet();
  }
}

final class AppRoute extends Equatable {
  final Widget page;
  final String path;
  const AppRoute({
    required this.page,
    required this.path,
  });

  @override
  List<Object> get props => [path];
}
