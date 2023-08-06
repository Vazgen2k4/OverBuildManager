import 'package:build_manager/domain/logic/auth/auth_bloc.dart';
import 'package:build_manager/ui/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is! AuthLoaded) return;

          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.home,
            (_) => false,
          );
        },
        child: const Center(
          child: Text(
            'Войдите в OverBuilManager c помощу Google',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Google'),
        onPressed: () {
          final authBloc = context.read<AuthBloc>();
          authBloc.add(const AuthWithGoogle());
        },
      ),
    );
  }
}
