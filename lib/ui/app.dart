import 'package:build_manager/domain/logic/projects/projects_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:build_manager/domain/logic/auth/auth_bloc.dart';
import 'package:build_manager/generated/l10n.dart';
import 'package:build_manager/ui/router/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:build_manager/ui/theme/app_color_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(const AuthLoading()),
        ),
        BlocProvider<ProjectsBloc>(
          create: (context) => ProjectsBloc()..add(const ProjectsToLoadEvent()),
        ),
      ],
      child: const MyAppSetting(),
    );
  }
}

class MyAppSetting extends StatelessWidget {
  const MyAppSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppColorTheme.darkTheme,
      initialRoute: AppRouter.initRoute,
      onGenerateRoute: AppRouter.generate,
    );
  }
}
