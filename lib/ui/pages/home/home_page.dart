import 'package:build_manager/domain/api/firebase_api.dart';
import 'package:build_manager/domain/logic/auth/auth_bloc.dart';
import 'package:build_manager/domain/logic/projects/projects_bloc.dart';
import 'package:build_manager/ui/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Главная страница'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'FAB1',
            child: const Text('Выход'),
            onPressed: () {
              final authBloc = context.read<AuthBloc>();
              authBloc.add(const AuthLogOutEvent());

              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.start,
                (_) => false,
              );
            },
          ),
          FloatingActionButton(
            heroTag: 'FAB2',
            child: const Text('Тест базы данных'),
            onPressed: () {
              final authState = context.read<AuthBloc>().state;
              if (authState is! AuthLoaded) {
                print('Нет авторизации');
                return;
              }

              final projectsBloc = context.read<ProjectsBloc>();

              final projectState = projectsBloc.state;
              if (projectState is! ProjectsLoaded) {
                print('Нет загрузки стейта');
                return;
              }

              print(projectState.user.name);
            },
          ),
        ],
      ),
    );
  }
}
