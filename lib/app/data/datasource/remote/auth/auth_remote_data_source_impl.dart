import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/auth/auth_remote_data_source.dart';
import 'package:main_platform/app/data/model/auth/request/login_request_model.dart';
import 'package:main_platform/app/data/model/auth/request/signup_request_model.dart';
import 'package:main_platform/app/data/model/auth/request/user_exists_request_model.dart';
import 'package:main_platform/app/data/model/auth/response/login_response_model.dart';
import 'package:main_platform/app/data/model/auth/response/refresh_token_response_model.dart';
import 'package:main_platform/app/data/model/auth/response/user_exists_response_model.dart';
import 'package:main_platform/app/data/model/auth/user_auth_model.dart';
import 'package:main_platform/app/domain/entity/auth/login_entity.dart';
import 'package:main_platform/app/domain/entity/auth/signup_entity.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<bool> isUserExists(UserExistsFilterKey filterKey, String value) async {
    var payload = UserExistsRequestModel(filterKey: filterKey, value: value);

    try {
      var resp = await getIt<Dio>().get('/user/exists',
          queryParameters: payload.toJson(),
          options: Options(headers: {'require-token': 'false'}));

      var result = UserExistsResponseModel.fromJson(resp.data);

      return result.exists;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> login(LoginEntity data) async {
    try {
      final payload = const LoginRequestModel().fromEntity(data);
      final resp = await getIt<Dio>().post('/auth/login',
          data: payload.toJson(),
          options: Options(headers: {'require-token': 'false'}));

      final tokens = LoginResponseModel.fromJson(resp.data);

      return tokens;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(SignUpEntity data) async {
    try {
      final SignUpRequestModel payload =
          const SignUpRequestModel().fromEntity(data);

      await getIt<Dio>().post('/user',
          data: payload.toJson(),
          options: Options(headers: {'require-token': 'false'}));
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<RefreshTokenResponseModel> refreshTokens() async {
    try {
      final resp = await getIt<Dio>().post('/auth/refresh',
          options: Options(headers: {
            'require-token': 'false',
            'require-refresh-token': 'true'
          }));
      final result = RefreshTokenResponseModel.fromJson(resp.data);
      return result;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthUserModel> getAuthUser() async {
    try {
      final resp = await getIt<Dio>().get('/user/me');
      final result = AuthUserModel.fromJson(resp.data);

      return result;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await getIt<Dio>().post('/auth/logout');
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> requestVerificationCode() async {
    try {
      await getIt<Dio>().post('/auth/request-code');
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> verifyEmailCode(String code) async {
    try {
      await getIt<Dio>().post('/auth/request-code', data: {'code': code});

      return;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
