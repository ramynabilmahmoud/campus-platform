import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/local/main/app_prefs_local_data_source.dart';
import 'package:main_platform/app/domain/repository/main/app_prefs_repository.dart';
import 'package:main_platform/core/di/di.dart';

@LazySingleton(as: AppPreferencesRepository)
class AppPreferencesRepositoryImpl implements AppPreferencesRepository {
  final AppPreferencesLocalDataSource _dataSource =
      getIt<AppPreferencesLocalDataSource>();

  AppPreferencesRepositoryImpl();

  @override
  Future<String> getLocale() {
    return _dataSource.getLocale();
  }

  @override
  Future<bool> isDarkMode() {
    return _dataSource.isDarkMode();
  }

  @override
  Future<void> setDarkMode(bool value) {
    return _dataSource.setDarkMode(value);
  }

  @override
  Future<void> setLocale(String locale) {
    return _dataSource.setLocale(locale);
  }
}
