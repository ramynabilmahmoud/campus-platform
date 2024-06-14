import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/user_entity.dart';
import 'package:main_platform/app/domain/usecase/auth/logout_usecase.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_state.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final _logoutUseCase = getIt<LogoutUseCase>();

  AuthStatus get status => state.status;

  set status(AuthStatus status) {
    emit(state.copyWith(status: status));
  }

  AuthCubit() : super(const AuthState.initial());

  void unauthenticated(Failure? error) {
    emit(AuthState.unauthenticated(error));
  }

  void expire() {
    emit(const AuthState.expired());
  }

  void initial() {
    emit(const AuthState.initial());
  }

  void loading() {
    emit(const AuthState.loading());
  }

  void authenticated(AuthUserEntity user) {
    emit(AuthState.authenticated(user));
  }

  void logout() {
    _logoutUseCase(NoParams());
  }

  // void authenticated()
}


// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
// import 'package:main_platform/app/auth/common/cache.dart';
// import 'package:main_platform/app/auth/common/model/auth_user_model.dart';
// import 'package:main_platform/app/auth/common/service/auth_service.dart';
// import 'package:main_platform/core/di/di.dart';
// import 'package:main_platform/core/error/failure.dart';

// enum AuthStatus { unknown, expired, authenticated, unauthenticated, loading }

// @lazySingleton
// class AuthController with ChangeNotifier {
//   final AuthService _authService = getIt<AuthService>();

//   AuthUserModel? user;
//   Failure? error;

//   AuthStatus get status => _status;

//   set status(AuthStatus status) {
//     _status = status;
//     notifyListeners();
//   }

//   Future<void> getAuthUser() async {
//     final cache = getIt<AuthCache>();
//     if (cache.accessToken == null) {}
//   }

//   Future<void> login(String identifier, String password) async {
//     status = AuthStatus.loading;
//     var result = await _authService.login(identifier, password);
//     result.fold((failure) {
//       error = failure;
//       status = AuthStatus.unauthenticated;
//       notifyListeners();
//     }, (tokens) {});
//   }
// }
