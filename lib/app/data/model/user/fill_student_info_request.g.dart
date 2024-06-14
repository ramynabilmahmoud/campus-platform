// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_student_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FillStudentInfoRequest _$FillStudentInfoRequestFromJson(
        Map<String, dynamic> json) =>
    FillStudentInfoRequest(
      studentCode: json['student_code'] as String,
      section: (json['section_number'] as num).toInt(),
      programId: json['program_id'] as String,
      semester: (json['semester'] as num).toInt(),
      academicYear: (json['academic_year'] as num).toInt(),
    );

Map<String, dynamic> _$FillStudentInfoRequestToJson(
        FillStudentInfoRequest instance) =>
    <String, dynamic>{
      'student_code': instance.studentCode,
      'section_number': instance.section,
      'program_id': instance.programId,
      'semester': instance.semester,
      'academic_year': instance.academicYear,
    };
