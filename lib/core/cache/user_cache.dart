import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/user/privacy_settings_entity.dart';

@lazySingleton
class UserCache {
  PrivacySettingsEntity? privacySettings;
}
