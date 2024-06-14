import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_entity.freezed.dart';

@freezed
class ProgramEntity with _$ProgramEntity {
  const factory ProgramEntity(
      {required String? id,
      required String? code,
      required String? name,
      required String? headId,
      required String? parentId,
      required int? flags,
      required double? createdAt,
      required double? updatedAt}) = _ProgramEntity;
}
