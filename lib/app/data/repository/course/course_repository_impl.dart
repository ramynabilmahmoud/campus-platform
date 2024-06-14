import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/course/course_remote_datasource.dart';
import 'package:main_platform/app/domain/entity/course/create_course_entity.dart';
import 'package:main_platform/app/domain/repository/course/course_repository.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/dio_error_handler.dart';
import 'package:main_platform/core/error/failure.dart';

@LazySingleton(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource _courseRemoteDataSource =
      getIt<CourseRemoteDataSource>();

  @override
  Future<Either<Failure, String?>> createNewCourse(
      CreateCourseEntity course) async {
    try {
      String? courseId = await _courseRemoteDataSource.createNewCourse(course);
      return right(courseId);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }
}
