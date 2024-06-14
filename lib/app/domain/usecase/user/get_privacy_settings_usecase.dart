import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/user/privacy_settings_entity.dart';
import 'package:main_platform/app/domain/repository/user/user_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class GetPrivacySettingsUseCase
    extends BaseUseCase<Either<Failure, PrivacySettingsEntity>, NoParams> {
  final UserRepository _userRepository = getIt<UserRepository>();

  @override
  Future<Either<Failure, PrivacySettingsEntity>> call(NoParams params) {
    return _userRepository.loadPrivacySettings();
  }
}
