import 'package:freezed_annotation/freezed_annotation.dart';

part 'fill_student_info_request.g.dart';

@JsonSerializable()
class FillStudentInfoRequest {
  @JsonKey(name: 'student_code')
  final String studentCode;

  @JsonKey(name: 'section_number')
  final int section;

  @JsonKey(name: 'program_id')
  final String programId;

  @JsonKey(name: 'semester')
  final int semester;

  @JsonKey(name: 'academic_year')
  final int academicYear;

  FillStudentInfoRequest(
      {required this.studentCode,
      required this.section,
      required this.programId,
      required this.semester,
      required this.academicYear});

  Map<String, dynamic> toJson() => _$FillStudentInfoRequestToJson(this);
}
