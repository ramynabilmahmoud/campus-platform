import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/edit_profile/edit_profile_remote_datasource.dart';
import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';
import 'package:main_platform/app/domain/repository/edit_profile/edit_profile_repository.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/dio_error_handler.dart';
import 'package:main_platform/core/error/failure.dart';

@LazySingleton(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  @override
  Future<Either<Failure, bool>> editProfile(
      EditProfileEntity editProfileEntity) async {
    try {
      bool? response = await getIt<EditProfileRemoteDataSource>()
          .editProfile(editProfileEntity);
      return right(response);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }
}
