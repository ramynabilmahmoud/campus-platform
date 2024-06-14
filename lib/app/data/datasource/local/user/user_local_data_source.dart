import 'package:main_platform/app/data/model/user/privacy_settings_model.dart';

abstract interface class UserLocalDataSoruce {
  Future<PrivacySettingsModel?> getPrivacySettings();
  Future<void> setPrivacySettings(PrivacySettingsModel settings);
}
