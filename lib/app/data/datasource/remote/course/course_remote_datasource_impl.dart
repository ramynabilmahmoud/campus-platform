import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/course/course_remote_datasource.dart';
import 'package:main_platform/app/data/model/course/request/create_course_request_model.dart';
import 'package:main_platform/app/data/model/course/response/create_course_response_model.dart';
import 'package:main_platform/app/domain/entity/course/create_course_entity.dart';
import 'package:main_platform/core/di/di.dart';

@LazySingleton(as: CourseRemoteDataSource)
class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  @override
  Future<String?> createNewCourse(CreateCourseEntity course) async {
    try {
      final model = const CreateCourseRequestModel().fromEntity(course);
      final payload = model.toJson();
      if (course.image != null) {
        var ext = course.image!.name.split('.').last;
        var name = '${md5.convert(utf8.encode(course.image!.path))}.$ext';
        if (kIsWeb) {
          var bytes = await course.image!.readAsBytes();
          payload['image'] = MultipartFile.fromBytes(bytes, filename: name);
        } else {
          payload['image'] =
              await MultipartFile.fromFile(course.image!.path, filename: name);
        }
      }
      final resp =
          await getIt<Dio>().post('/course', data: FormData.fromMap(payload));
      final respModel = CreateCourseResponseModel.fromJson(resp.data);
      return respModel.courseId;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
