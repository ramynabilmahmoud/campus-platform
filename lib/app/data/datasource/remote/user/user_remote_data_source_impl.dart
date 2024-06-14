import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/user/user_remote_data_source.dart';
import 'package:main_platform/app/data/model/user/fill_student_info_request.dart';
import 'package:main_platform/app/data/model/user/privacy_settings_model.dart';
import 'package:main_platform/app/data/model/user/settings_model.dart';
import 'package:main_platform/core/di/di.dart';

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<PrivacySettingsModel> getPrivacySettings() async {
    try {
      final resp = await getIt<Dio>().get('/user/me/privacy');
      final model = PrivacySettingsModel.fromJson(resp.data);
      return model;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<SettingsModel> getUserPreferences() async {
    try {
      final resp = await getIt<Dio>().get('/user/me/preferences');
      final model = SettingsModel.fromJson(resp.data);
      return model;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setPrivacySettings(PrivacySettingsModel settings) async {
    try {
      await getIt<Dio>().put('/user/me/privacy', data: settings.toJson());
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> fillStudentInfo(FillStudentInfoRequest payload) async {
    try {
      await getIt<Dio>().put('/user/me/student', data: payload.toJson());
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
