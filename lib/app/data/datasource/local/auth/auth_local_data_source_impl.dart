import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/local/auth/auth_local_data_srouce.dart';
import 'package:main_platform/app/data/model/auth/user_auth_model.dart';
import 'package:main_platform/core/constants/hive_consts.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<String?> getAccessToken() async {
    final box = Hive.box(HiveBoxes.auth);
    String? accessToken = await box.get("access_token", defaultValue: null);
    return accessToken;
  }

  @override
  Future<void> setAccessToken(String accessToken) async {
    final box = Hive.box(HiveBoxes.auth);
    await box.put("access_token", accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    final box = Hive.box(HiveBoxes.auth);
    String? refreshToken = await box.get("refresh_token", defaultValue: null);
    return refreshToken;
  }

  @override
  Future<void> setRefreshToken(String refreshToken) async {
    final box = Hive.box(HiveBoxes.auth);
    await box.put("refresh_token", refreshToken);
  }

  @override
  Future<void> clearAccessToken() async {
    final box = Hive.box(HiveBoxes.auth);
    box.delete("access_token");
  }

  @override
  Future<void> clearRefreshToken() async {
    final box = Hive.box(HiveBoxes.auth);
    box.delete("refresh_token");
  }

  @override
  Future<AuthUserModel?> getAuthUser() async {
    final box = Hive.box(HiveBoxes.auth);
    AuthUserModel? user = await box.get("user");
    return user;
  }

  @override
  Future<void> clearUserData() async {
    final box = Hive.box(HiveBoxes.auth);
    box.delete("user");
  }
}
