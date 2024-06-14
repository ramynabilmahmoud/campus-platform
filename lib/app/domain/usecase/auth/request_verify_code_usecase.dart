import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

class RequestVerifyCodeUseCase
    extends BaseUseCase<Either<Failure, void>, NoParams> {
  final _authRepository = getIt<AuthRepository>();

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _authRepository.requestVerificationCode();
  }
}
