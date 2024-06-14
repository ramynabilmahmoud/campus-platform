// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_course_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCourseRequestModel _$CreateCourseRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateCourseRequestModel(
      courseName: json['name'] as String?,
      courseCode: json['code'] as String?,
      programId: json['program_id'] as String?,
      community: json['community'] as bool?,
      semester: (json['semester'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateCourseRequestModelToJson(
        CreateCourseRequestModel instance) =>
    <String, dynamic>{
      'name': instance.courseName,
      'code': instance.courseCode,
      'program_id': instance.programId,
      'community': instance.community,
      'semester': instance.semester,
    };
