import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/core/constants/hive_consts.dart';

part 'program_model.g.dart';

@HiveType(typeId: HiveTypes.programModel)
@JsonSerializable()
class ProgramModel with EntityConvertible<ProgramModel, ProgramEntity> {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? code;

  @HiveField(2)
  final String? name;

  @JsonKey(name: 'parent_id')
  @HiveField(3)
  final String? parentId;

  @JsonKey(name: 'head_id')
  @HiveField(4)
  final String? headId;

  @HiveField(5)
  final int? flags;

  @JsonKey(name: 'created_at')
  @HiveField(6)
  final double? createdAt;

  @JsonKey(name: 'updated_at')
  @HiveField(7)
  final double? updatedAt;

  const ProgramModel({
    this.id,
    this.code,
    this.name,
    this.headId,
    this.parentId,
    this.flags,
    this.createdAt,
    this.updatedAt,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);

  @override
  ProgramEntity toEntity() => ProgramEntity(
        id: id,
        code: code,
        name: name,
        headId: headId,
        parentId: parentId,
        flags: flags,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  ProgramModel fromEntity(ProgramEntity model) => ProgramModel(
        id: model.id,
        code: model.code,
        name: model.name,
        headId: model.headId,
        parentId: model.parentId,
        flags: model.flags,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
      );
}
