import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_platform/app/domain/entity/course/course_participant_entity.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';

part 'course_entity.freezed.dart';

@freezed
class CourseEntity with _$CourseEntity {
  const factory CourseEntity({
    required String? id,
    required String? name,
    required String? code,
    required String? imageUrl,
    required String? ownerId,
    required int? semester,
    required List<CourseParticipantEntity> someParticipants,
    required ProgramEntity? program,
  }) = _CourseEntity;
}
