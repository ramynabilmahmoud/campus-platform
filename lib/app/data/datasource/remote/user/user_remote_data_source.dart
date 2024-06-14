import 'package:main_platform/app/data/model/user/fill_student_info_request.dart';
import 'package:main_platform/app/data/model/user/privacy_settings_model.dart';
import 'package:main_platform/app/data/model/user/settings_model.dart';

abstract interface class UserRemoteDataSource {
  Future<PrivacySettingsModel> getPrivacySettings();
  Future<SettingsModel> getUserPreferences();

  Future<void> fillStudentInfo(FillStudentInfoRequest payload);

  Future<void> setPrivacySettings(PrivacySettingsModel settings);
}
