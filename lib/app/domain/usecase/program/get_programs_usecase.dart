import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/repository/program/program_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class GetProgramsUseCase
    extends BaseUseCase<Either<Failure, List<ProgramEntity>>, NoParams> {
  final ProgramRepository _programRepository = getIt<ProgramRepository>();

  @override
  Future<Either<Failure, List<ProgramEntity>>> call(NoParams? params) {
    return _programRepository.getProgramList();
  }
}
