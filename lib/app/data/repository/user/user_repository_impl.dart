import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/local/user/user_local_data_source.dart';
import 'package:main_platform/app/data/datasource/remote/user/user_remote_data_source.dart';
import 'package:main_platform/app/data/model/user/fill_student_info_request.dart';
import 'package:main_platform/app/data/model/user/privacy_settings_model.dart';
import 'package:main_platform/app/domain/entity/user/privacy_settings_entity.dart';
import 'package:main_platform/app/domain/repository/user/user_repository.dart';
import 'package:main_platform/core/cache/user_cache.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/dio_error_handler.dart';
import 'package:main_platform/core/error/failure.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource = getIt<UserRemoteDataSource>();
  final UserLocalDataSoruce _localDataSoruce = getIt<UserLocalDataSoruce>();

  @override
  Future<Either<Failure, PrivacySettingsEntity>> getPrivacySettings() async {
    try {
      final model = await _remoteDataSource.getPrivacySettings();
      return right(model.toEntity());
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, PrivacySettingsEntity>> loadPrivacySettings() async {
    var entity = getIt<UserCache>().privacySettings;

    PrivacySettingsModel? model;

    try {
      model = await _remoteDataSource.getPrivacySettings();
      entity = getIt<UserCache>().privacySettings = model.toEntity();
      return right(entity);
    } on DioException catch (exc) {
      if (entity != null) {
        return right(entity);
      }

      model = await _localDataSoruce.getPrivacySettings();

      if (model != null) {
        entity = getIt<UserCache>().privacySettings = model.toEntity();
        return right(entity);
      } else {
        return left(getServerException(exc));
      }
    }
  }

  @override
  Future<PrivacySettingsEntity?> getStoredPrivacySettings() async {
    final model = await _localDataSoruce.getPrivacySettings();
    return model?.toEntity();
  }

  @override
  Future<Either<Failure, void>> setPrivacySetings(
      PrivacySettingsEntity settings) async {
    try {
      await _remoteDataSource.setPrivacySettings(
          const PrivacySettingsModel().fromEntity(settings));
      getIt<UserCache>().privacySettings = settings;

      return right(null);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }

  @override
  Future<Either<Failure, void>> fillStudentInfo(
      {required String studentCode,
      required String programId,
      required int semester,
      required int section,
      required int academicYear}) async {
    try {
      final payload = FillStudentInfoRequest(
          studentCode: studentCode,
          section: section,
          programId: programId,
          semester: semester,
          academicYear: academicYear);
      await _remoteDataSource.fillStudentInfo(payload);
      return right(null);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }
}
