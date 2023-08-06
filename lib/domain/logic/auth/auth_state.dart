part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoaded extends AuthState {
  final bool hasAuth;

  const AuthLoaded({
    required this.hasAuth,
  });

  @override
  List<Object?> get props => [hasAuth];

  AuthLoaded copyWith({
    bool? hasAuth,
  }) {
    return AuthLoaded(
      hasAuth: hasAuth ?? this.hasAuth,
    );
  }
}
