import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/profile/profile_info_entity.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class ProfileInfoRepository {
  Future<Either<Failure, ProfileInfoEntity>> getProfileInfo(String? id);

}
