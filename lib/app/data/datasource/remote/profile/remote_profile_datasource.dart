import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/model/profile/profile_info_model.dart';
import 'package:main_platform/app/domain/entity/profile/profile_info_entity.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class RemoteProfileDataSource {
  Future<Either<Failure, ProfileInfoEntity>> getProfileInfo(String? id);
}

@Injectable(as: RemoteProfileDataSource)
class RemoteProfileDataSourceImpl implements RemoteProfileDataSource {
  @override
  Future<Either<Failure, ProfileInfoEntity>> getProfileInfo(String? id) async {
    try {
      id ??= getIt<AuthCache>().user!.id;
      final response = await getIt<Dio>().get("/user/$id/profile");
      if (response.statusCode == 200) {
        final json = response.data;
        final profile = ProfileInfoModel.fromJson(json);
        print(profile);
        print(profile.toEntity());
        return Right(profile.toEntity());
      } else {
        return const Left(Failure("Failed to fetch profile info"));
      }
    } on DioException catch (e) {
      return Left(Failure(e.message!));
    }
  }
}
