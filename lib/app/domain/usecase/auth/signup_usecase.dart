import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/signup_entity.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class SignUpUseCase
    implements BaseUseCase<Either<Failure, void>, SignUpEntity> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  SignUpUseCase();

  @override
  Future<Either<Failure, void>> call(SignUpEntity data) {
    return _authRepository.signUp(data);
  }
}
