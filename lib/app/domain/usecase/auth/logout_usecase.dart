import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_cubit.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class LogoutUseCase implements BaseUseCase<void, NoParams> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  LogoutUseCase();

  @override
  Future<void> call(NoParams? data) async {
    await _authRepository.logout();
    getIt<AuthCubit>().unauthenticated(null);
  }
}
