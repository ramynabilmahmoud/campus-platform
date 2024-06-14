import 'package:main_platform/app/data/model/auth/response/login_response_model.dart';
import 'package:main_platform/app/data/model/auth/response/refresh_token_response_model.dart';
import 'package:main_platform/app/data/model/auth/user_auth_model.dart';
import 'package:main_platform/app/domain/entity/auth/login_entity.dart';
import 'package:main_platform/app/domain/entity/auth/signup_entity.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';

abstract interface class AuthRemoteDataSource {
  Future<bool> isUserExists(UserExistsFilterKey filterKey, String value);

  Future<void> signUp(SignUpEntity data);

  Future<LoginResponseModel> login(LoginEntity data);

  Future<RefreshTokenResponseModel> refreshTokens();

  Future<AuthUserModel> getAuthUser();

  Future<void> requestVerificationCode();

  Future<void> verifyEmailCode(String code);

  Future<void> logout();
}
