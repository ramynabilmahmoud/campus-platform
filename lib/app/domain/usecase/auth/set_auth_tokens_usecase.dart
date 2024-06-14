import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class SetAuthTokensUseCase extends BaseUseCase<void, UserAuthTokensEntity> {
  final _authRepository = getIt<AuthRepository>();

  @override
  Future<void> call(UserAuthTokensEntity params) async {
    getIt<AuthCache>().accessToken = params.accessToken;
    getIt<AuthCache>().refreshToken = params.refreshToken;

    if (params.accessToken != null) {
      _authRepository.saveAccessToken(params.accessToken!);
    }
    if (params.refreshToken != null) {
      _authRepository.saveRefreshToken(params.refreshToken!);
    }
  }
}
