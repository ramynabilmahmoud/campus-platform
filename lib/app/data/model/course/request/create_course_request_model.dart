import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/course/create_course_entity.dart';

part 'create_course_request_model.g.dart';

@JsonSerializable()
class CreateCourseRequestModel
    with EntityConvertible<CreateCourseRequestModel, CreateCourseEntity> {
  @JsonKey(name: 'name')
  final String? courseName;

  @JsonKey(name: 'code')
  final String? courseCode;

  @JsonKey(name: 'program_id')
  final String? programId;

  final bool? community;

  final int? semester;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final XFile? image;

  const CreateCourseRequestModel({
    this.courseName,
    this.courseCode,
    this.programId,
    this.community,
    this.semester,
    this.image,
  });

  factory CreateCourseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCourseRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCourseRequestModelToJson(this);

  @override
  CreateCourseRequestModel fromEntity(CreateCourseEntity model) =>
      CreateCourseRequestModel(
          courseName: model.courseName,
          courseCode: model.courseCode,
          programId: model.programId,
          community: model.community,
          semester: model.semester,
          image: model.image);

  @override
  CreateCourseEntity toEntity() => CreateCourseEntity(
      courseName: courseName,
      courseCode: courseCode,
      community: community,
      programId: programId,
      semester: semester,
      image: image);
}
