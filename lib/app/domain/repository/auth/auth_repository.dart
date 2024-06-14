import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/auth/login_entity.dart';
import 'package:main_platform/app/domain/entity/auth/signup_entity.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';
import 'package:main_platform/app/domain/entity/auth/user_entity.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> isUserExists(
      UserExistsFilterKey filterKey, String value);

  Future<Either<Failure, void>> signUp(SignUpEntity data);

  Future<Either<Failure, UserAuthTokensEntity>> login(LoginEntity data);

  Future<String?> loadRefreshToken();

  Future<Either<Failure, String>> loadAccessToken();

  Future<Either<Failure, UserAuthTokensEntity>> refreshToken();

  Future<Either<Failure, AuthUserEntity>> getAuthUser();

  Future<Either<Failure, AuthUserEntity>> loadAuthUser();

  Future<Either<Failure, void>> requestVerificationCode();
  Future<Either<Failure, void>> verifyEmailCode(String code);

  Future<void> saveAccessToken(String accessToken);

  Future<void> saveRefreshToken(String refreshToken);

  Future<void> logout();
}
