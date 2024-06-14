import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/main/app_prefs_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class SetDarkModeUseCase implements BaseUseCase<void, bool> {
  final AppPreferencesRepository _repository =
      getIt<AppPreferencesRepository>();

  SetDarkModeUseCase();

  @override
  Future<void> call(bool value) {
    return _repository.setDarkMode(value);
  }
}
