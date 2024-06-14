import 'package:equatable/equatable.dart';
import 'package:main_platform/app/domain/entity/auth/user_entity.dart';
import 'package:main_platform/core/error/failure.dart';

enum AuthStatus {
  unknown,
  expired,
  authenticated,
  unauthenticated,
  loading,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final Failure? error;
  final AuthUserEntity? user;

  const AuthState({this.status = AuthStatus.unknown, this.error, this.user});

  const AuthState.initial() : this();

  const AuthState.authenticated(AuthUserEntity user)
      : this(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated(Failure? error)
      : this(status: AuthStatus.unauthenticated, error: error);

  const AuthState.loading() : this(status: AuthStatus.loading);

  const AuthState.expired() : this(status: AuthStatus.expired);

  AuthState copyWith(
      {AuthStatus? status, Failure? error, AuthUserEntity? user}) {
    return AuthState(
        status: status ?? this.status,
        error: error ?? this.error,
        user: user ?? this.user);
  }

  @override
  List<Object?> get props => [status, error];
}
