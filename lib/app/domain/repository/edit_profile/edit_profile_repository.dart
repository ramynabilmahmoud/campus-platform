import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class EditProfileRepository {
  Future<Either<Failure, bool>> editProfile(
      EditProfileEntity editProfileEntity);
}
