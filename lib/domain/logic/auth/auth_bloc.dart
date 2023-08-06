import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _auth = FirebaseAuth.instance;
  final _gooleSignIn = GoogleSignIn();

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoading>(_load);
    on<AuthWithGoogle>(_authWithGoogle);
    on<AuthLogOutEvent>(_authLogOut);
  }

  Future<void> _load(
    AuthLoading event,
    Emitter<AuthState> emit,
  ) async {
    final hasAuth = FirebaseAuth.instance.currentUser != null;

    if (kDebugMode) {
      print('Авторизация: ${hasAuth ? 'Есть БраТишкА)))' : 'Её нетУ Брат'}');
    }

    final state = AuthLoaded(hasAuth: hasAuth);
    emit(state);
  }

  Future<void> _authWithGoogle(
    AuthWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    final state = this.state;
    if (state is! AuthLoaded) {
      if (kDebugMode) {
        print('Состояние не загруженно');
      }
      return;
    }

    try {
      final googleUser = await _gooleSignIn.signIn();

      if (googleUser == null) {
        if (kDebugMode) {
          print('Пользователь не найден');
        }
        return;
      }

      final googleUserInfo = await googleUser.authentication;

      final googleCerdential = GoogleAuthProvider.credential(
        idToken: googleUserInfo.idToken,
        accessToken: googleUserInfo.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(googleCerdential);

      emit(state.copyWith(hasAuth: true));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _authLogOut(
    AuthLogOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final state = this.state;
    if (state is! AuthLoaded) {
      if (kDebugMode) {
        print('Состояние не загруженно');
      }
      return;
    }

    try {
      await _gooleSignIn.signOut();
      emit(state.copyWith(hasAuth: false));
      
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
