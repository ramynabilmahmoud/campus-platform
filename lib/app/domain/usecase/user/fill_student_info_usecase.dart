import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/user/user_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

class FillStudentInfoUseCaseParams {
  final String studentCode;
  final String programId;
  final int semester;
  final int section;
  final int academicYear;

  FillStudentInfoUseCaseParams({
    required this.studentCode,
    required this.programId,
    required this.semester,
    required this.section,
    required this.academicYear,
  });
}

@lazySingleton
class FillStudentInfoUseCase
    extends BaseUseCase<Either<Failure, void>, FillStudentInfoUseCaseParams> {
  final UserRepository _userRepository = getIt<UserRepository>();

  @override
  Future<Either<Failure, void>> call(FillStudentInfoUseCaseParams params) {
    return _userRepository.fillStudentInfo(
        studentCode: params.studentCode,
        programId: params.programId,
        semester: params.semester,
        section: params.section,
        academicYear: params.academicYear);
  }
}
