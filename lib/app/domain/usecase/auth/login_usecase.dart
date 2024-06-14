import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/login_entity.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class LoginUseCase
    implements BaseUseCase<Either<Failure, UserAuthTokensEntity>, LoginEntity> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  LoginUseCase();

  @override
  Future<Either<Failure, UserAuthTokensEntity>> call(LoginEntity data) {
    return _authRepository.login(data);
  }
}
