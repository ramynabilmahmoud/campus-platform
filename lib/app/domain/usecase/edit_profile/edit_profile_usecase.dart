import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';
import 'package:main_platform/app/domain/repository/edit_profile/edit_profile_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class EditProfileUseCase
    extends BaseUseCase<Either<Failure, bool>, EditProfileEntity> {
  final EditProfileRepository _repository = getIt<EditProfileRepository>();

  @override
  Future<Either<Failure, bool>> call(EditProfileEntity params) {
    return _repository.editProfile(params);
  }
}
