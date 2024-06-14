import 'package:image_picker/image_picker.dart';

class CreateCourseEntity {
  final String? courseName;
  final String? courseCode;
  final bool? community;
  final String? programId;
  final int? semester;
  final XFile? image;

  const CreateCourseEntity(
      {this.courseName,
      this.courseCode,
      this.community,
      this.programId,
      this.semester,
      this.image});
}
