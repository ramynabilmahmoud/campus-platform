import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/user_entity.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class LoadAuthUserUseCase
    extends BaseUseCase<Either<Failure, AuthUserEntity>, NoParams> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @override
  Future<Either<Failure, AuthUserEntity>> call(NoParams? params)  {
    return _authRepository.loadAuthUser();
  }
}
