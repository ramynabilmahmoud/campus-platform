import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/local/main/app_prefs_local_data_source.dart';
import 'package:main_platform/core/constants/hive_consts.dart';
import 'package:main_platform/core/utils/native_locale.dart';

@LazySingleton(as: AppPreferencesLocalDataSource)
class AppPreferencesLocalDataSourceImpl
    implements AppPreferencesLocalDataSource {
  @override
  Future<String> getLocale() async {
    final box = Hive.box(HiveBoxes.preferences);

    return await box.get("locale", defaultValue: NativeLocale.defaultLocale)
        as String;
  }

  @override
  Future<bool> isDarkMode() async {
    final box = Hive.box(HiveBoxes.preferences);

    return await box.get("dark", defaultValue: false) as bool;
  }

  @override
  Future<void> setLocale(String locale) async {
    final box = Hive.box(HiveBoxes.preferences);
    box.put("locale", locale);
  }

  @override
  Future<void> setDarkMode(bool set) async {
    final box = Hive.box(HiveBoxes.preferences);
    box.put("dark", set);
  }
}
