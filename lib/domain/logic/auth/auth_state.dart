part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoaded extends AuthState {
  final bool hasAuth;

  const AuthLoaded({
    required this.hasAuth,
  });

  @override
  List<Object?> get props => [hasAuth];

  AuthLoaded copyWith({
    bool? hasAuth,
  }) {
    return AuthLoaded(hasAuth: hasAuth ?? this.hasAuth);
  }
}
