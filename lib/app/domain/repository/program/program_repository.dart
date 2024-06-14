import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class ProgramRepository {
  Future<Either<Failure, List<ProgramEntity>>> getProgramList();
}
