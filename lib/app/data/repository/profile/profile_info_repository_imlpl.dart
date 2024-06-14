import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/profile/remote_profile_datasource.dart';
import 'package:main_platform/app/domain/entity/profile/profile_info_entity.dart';
import 'package:main_platform/app/domain/repository/profile/profile_info_repository.dart';
import 'package:main_platform/core/error/failure.dart';

@Injectable(as: ProfileInfoRepository)
class ProfileInfoRepositoryImpl implements ProfileInfoRepository {
  final RemoteProfileDataSource datasource;

  ProfileInfoRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, ProfileInfoEntity>> getProfileInfo(String? id) {
    return datasource.getProfileInfo(id);
  }
}
