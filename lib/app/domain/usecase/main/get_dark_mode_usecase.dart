import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/main/app_prefs_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class GetDarkModeUseCase implements BaseUseCase<bool, NoParams> {
  final AppPreferencesRepository _repository =
      getIt<AppPreferencesRepository>();

  GetDarkModeUseCase();

  @override
  Future<bool> call(NoParams? params) async {
    return _repository.isDarkMode();
  }
}
