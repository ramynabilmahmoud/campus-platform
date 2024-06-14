import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/program/program_remote_datasource.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/app/domain/repository/program/program_repository.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/dio_error_handler.dart';
import 'package:main_platform/core/error/failure.dart';

@LazySingleton(as: ProgramRepository)
class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramRemoteDataSource _remoteDataSource =
      getIt<ProgramRemoteDataSource>();

  @override
  Future<Either<Failure, List<ProgramEntity>>> getProgramList() async {
    try {
      final models = await _remoteDataSource.getProgramList();
      var entities = models.map((e) => e.toEntity()).toList();
      return right(entities);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }
}
