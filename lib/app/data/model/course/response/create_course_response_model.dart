import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_course_response_model.g.dart';

@JsonSerializable()
class CreateCourseResponseModel {
  @JsonKey(name: "course_id")
  final String? courseId;

  const CreateCourseResponseModel({this.courseId});

  factory CreateCourseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCourseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCourseResponseModelToJson(this);
}
