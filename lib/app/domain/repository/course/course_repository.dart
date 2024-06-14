import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/course/create_course_entity.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class CourseRepository {
  Future<Either<Failure, String?>> createNewCourse(CreateCourseEntity course);
}
