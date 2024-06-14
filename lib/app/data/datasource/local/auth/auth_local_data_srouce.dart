import 'package:main_platform/app/data/model/auth/user_auth_model.dart';

abstract interface class AuthLocalDataSource {
  Future<void> setAccessToken(String accessToken);

  Future<void> setRefreshToken(String refreshToken);

  Future<void> clearAccessToken();

  Future<void> clearRefreshToken();

  Future<void> clearUserData();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<AuthUserModel?> getAuthUser();
}
