import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

class VerifyEmailCodeUseCase
    extends BaseUseCase<Either<Failure, void>, String> {
  final _authRepository = getIt<AuthRepository>();

  @override
  Future<Either<Failure, void>> call(String params) {
    return _authRepository.verifyEmailCode(params);
  }
}
