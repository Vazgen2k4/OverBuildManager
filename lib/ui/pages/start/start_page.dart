import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:build_manager/domain/logic/auth/auth_bloc.dart';
import 'package:build_manager/ui/router/app_routes.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is! AuthLoaded) return;

        final nextRouteName = state.hasAuth ? AppRoutes.home : AppRoutes.auth;
        
        Navigator.of(context).pushNamedAndRemoveUntil(
          nextRouteName,
          (route) => false,
        );
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
