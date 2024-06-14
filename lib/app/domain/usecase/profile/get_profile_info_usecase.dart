import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/profile/profile_info_entity.dart';
import 'package:main_platform/app/domain/repository/profile/profile_info_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/error/failure.dart';

@injectable
class GetProfileInfoUseCase
    implements BaseUseCase<Either<Failure, ProfileInfoEntity>, String?> {
  final ProfileInfoRepository profileInfoRepository;

  GetProfileInfoUseCase({required this.profileInfoRepository});

  @override
  Future<Either<Failure, ProfileInfoEntity>> call(String? id) {
    return profileInfoRepository.getProfileInfo(id);
  }
}
