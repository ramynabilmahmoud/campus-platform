import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

class RefreshTokensUseCase
    extends BaseUseCase<Either<Failure, UserAuthTokensEntity>, NoParams> {
  final _authRepository = getIt<AuthRepository>();

  @override
  Future<Either<Failure, UserAuthTokensEntity>> call(NoParams? params) {
    return _authRepository.refreshToken();
  }
}
