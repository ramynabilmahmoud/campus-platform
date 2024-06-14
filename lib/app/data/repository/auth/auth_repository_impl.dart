import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/local/auth/auth_local_data_srouce.dart';
import 'package:main_platform/app/data/datasource/remote/auth/auth_remote_data_source.dart';
import 'package:main_platform/app/data/model/auth/user_auth_model.dart';
import 'package:main_platform/app/domain/entity/auth/login_entity.dart';
import 'package:main_platform/app/domain/entity/auth/signup_entity.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';
import 'package:main_platform/app/domain/entity/auth/user_entity.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/constants/error_codes.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';
import 'package:main_platform/core/error/dio_error_handler.dart';
import 'package:main_platform/core/error/failure.dart';
import 'package:main_platform/core/utils/jwt.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _authLocalDataSource = getIt<AuthLocalDataSource>();
  final AuthRemoteDataSource _authRemoteDataSource =
      getIt<AuthRemoteDataSource>();

  AuthRepositoryImpl();

  @override
  Future<Either<Failure, bool>> isUserExists(
      UserExistsFilterKey filterKey, String value) async {
    try {
      bool result = await _authRemoteDataSource.isUserExists(filterKey, value);
      return right(result);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpEntity data) async {
    try {
      return right(await _authRemoteDataSource.signUp(data));
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, UserAuthTokensEntity>> login(LoginEntity data) async {
    try {
      var result = await _authRemoteDataSource.login(data);
      return right(result.toEntity());
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, String>> loadAccessToken() async {
    String? accessToken = getIt<AuthCache>().accessToken;
    if (accessToken != null && !hasTokenExpired(accessToken)) {
      return right(accessToken);
    }

    accessToken = await _authLocalDataSource.getAccessToken();
    if (accessToken != null && !hasTokenExpired(accessToken)) {
      getIt<AuthCache>().accessToken = accessToken;
      return right(accessToken);
    }

    String? refreshToken = await loadRefreshToken();
    if (refreshToken != null) {
      if (refreshToken != "expired") {
        try {
          var tokens = await _authRemoteDataSource.refreshTokens();
          getIt<AuthCache>().accessToken = accessToken = tokens.accessToken;
          getIt<AuthCache>().refreshToken = refreshToken = tokens.refreshToken;

          _authLocalDataSource.setAccessToken(accessToken!);
          _authLocalDataSource.setRefreshToken(refreshToken!);
          return right(accessToken);
        } on DioException catch (exc) {
          return left(getServerException(exc));
        }
      } else {
        return left(const Failure("session expired",
            code: AuthErrorCodes.sessionExpired));
      }
    }
    return left(const Failure("unauthenticated"));
  }

  @override
  Future<String?> loadRefreshToken() async {
    String? refreshToken = getIt<AuthCache>().refreshToken;
    if (refreshToken != null) {
      if (!hasTokenExpired(refreshToken)) {
        return refreshToken;
      } else {
        _expire();
        return "expired";
      }
    }

    refreshToken = await _authLocalDataSource.getRefreshToken();
    if (refreshToken != null) {
      if (!hasTokenExpired(refreshToken)) {
        getIt<AuthCache>().refreshToken = refreshToken;
        return refreshToken;
      } else {
        _expire();
        return "expired";
      }
    }

    return null;
  }

  @override
  Future<Either<Failure, UserAuthTokensEntity>> refreshToken() async {
    try {
      var tokens = await _authRemoteDataSource.refreshTokens();
      return right(tokens.toEntity());
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> getAuthUser() async {
    try {
      final userModel = await _authRemoteDataSource.getAuthUser();
      final user = userModel.toEntity();
      return right(user);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> loadAuthUser() async {
    AuthUserEntity? user = getIt<AuthCache>().user;
    AuthUserModel? userModel;

    if (user != null) {
      return right(user);
    }

    userModel = await _authLocalDataSource.getAuthUser();

    if (userModel != null) {
      user = userModel.toEntity();
      getIt<AuthCache>().user = user;
      return right(user);
    }

    try {
      userModel = await _authRemoteDataSource.getAuthUser();
      user = userModel.toEntity();
      getIt<AuthCache>().user = user;

      return right(user);
    } on DioException catch (exc) {
      getIt<AuthCache>().user = null;
      return left(getServerException(exc));
    }
  }

  void _expire() {
    _authLocalDataSource.clearAccessToken();
    _authLocalDataSource.clearRefreshToken();

    getIt<AuthCache>().accessToken = null;
    getIt<AuthCache>().refreshToken = null;
  }

  @override
  Future<void> saveAccessToken(String accessToken) {
    return _authLocalDataSource.setAccessToken(accessToken);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) {
    return _authLocalDataSource.setRefreshToken(refreshToken);
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _authRemoteDataSource.logout();

      await _authLocalDataSource.clearAccessToken();
      await _authLocalDataSource.clearRefreshToken();
      await _authLocalDataSource.clearUserData();

      getIt<AuthCache>().accessToken = null;
      getIt<AuthCache>().refreshToken = null;
      getIt<AuthCache>().user = null;

      return right(null);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, void>> requestVerificationCode() async {
    try {
      await _authRemoteDataSource.requestVerificationCode();

      return right(null);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmailCode(String code) async {
    try {
      await _authRemoteDataSource.verifyEmailCode(code);

      return right(null);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }
}
