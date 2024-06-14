import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/course/create_course_entity.dart';
import 'package:main_platform/app/domain/repository/course/course_repository.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

@lazySingleton
class CreateCourseUseCase
    extends BaseUseCase<Either<Failure, String?>, CreateCourseEntity> {
  final CourseRepository _repository = getIt<CourseRepository>();

  @override
  Future<Either<Failure, String?>> call(CreateCourseEntity params) {
    return _repository.createNewCourse(params);
  }
}
