import 'package:main_platform/app/domain/entity/course/create_course_entity.dart';

abstract interface class CourseRemoteDataSource {
  Future<String?> createNewCourse(CreateCourseEntity course);
}
