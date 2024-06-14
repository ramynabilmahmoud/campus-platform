import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class LoadRefreshTokenUseCase extends BaseUseCase<String?, NoParams> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @override
  Future<String?> call(NoParams? params) {
    return _authRepository.loadRefreshToken();
  }
}
