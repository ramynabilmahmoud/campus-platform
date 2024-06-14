import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class LoadAccessTokenUseCase
    extends BaseUseCase<Either<Failure, String>, NoParams> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @override
  Future<Either<Failure, String>> call(NoParams? params) {
    return _authRepository.loadAccessToken();
  }
}
