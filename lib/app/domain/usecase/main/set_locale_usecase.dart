import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/main/app_prefs_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class SetLocaleUseCase implements BaseUseCase<void, String> {
  final AppPreferencesRepository _repository =
      getIt<AppPreferencesRepository>();

  SetLocaleUseCase();

  @override
  Future<void> call(String locale) {
    return _repository.setLocale(locale);
  }
}
