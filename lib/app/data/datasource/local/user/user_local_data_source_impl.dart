import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/local/user/user_local_data_source.dart';
import 'package:main_platform/app/data/model/user/privacy_settings_model.dart';
import 'package:main_platform/core/constants/hive_consts.dart';

@LazySingleton(as: UserLocalDataSoruce)
class UserLocalDataSoruceImpl implements UserLocalDataSoruce {
  @override
  Future<PrivacySettingsModel?> getPrivacySettings() async {
    final box = Hive.box(HiveBoxes.user);
    PrivacySettingsModel? model = await box.get("privacy");
    return model;
  }

  @override
  Future<void> setPrivacySettings(PrivacySettingsModel settings) async {
    final box = Hive.box(HiveBoxes.user);
    await box.put("privacy", settings);
  }
}
