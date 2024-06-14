import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/user/privacy_settings_entity.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class UserRepository {
  Future<Either<Failure, PrivacySettingsEntity>> loadPrivacySettings();
  Future<Either<Failure, PrivacySettingsEntity>> getPrivacySettings();
  Future<PrivacySettingsEntity?> getStoredPrivacySettings();

  Future<Either<Failure, void>> fillStudentInfo({
    required String studentCode,
    required String programId,
    required int semester,
    required int section,
    required int academicYear,
  });

  Future<Either<Failure, void>> setPrivacySetings(
      PrivacySettingsEntity settings);
}
