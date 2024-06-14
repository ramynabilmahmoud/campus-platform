import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';
import 'package:main_platform/core/error/failure.dart';

class UserExistsParam {
  final UserExistsFilterKey filterKey;
  final String value;

  UserExistsParam({required this.filterKey, required this.value});
}

@lazySingleton
class UserExistsUseCase
    implements BaseUseCase<Either<Failure, bool>, UserExistsParam> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  UserExistsUseCase();

  @override
  Future<Either<Failure, bool>> call(UserExistsParam params) {
    return _authRepository.isUserExists(params.filterKey, params.value);
  }
}
