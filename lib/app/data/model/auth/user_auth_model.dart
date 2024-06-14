import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/data/model/auth/user_flags_model.dart';
import 'package:main_platform/app/domain/entity/auth/user_entity.dart';
import 'package:main_platform/core/constants/hive_consts.dart';

part 'user_auth_model.g.dart';

@HiveType(typeId: HiveTypes.userModel)
@JsonSerializable()
class AuthUserModel with EntityConvertible<AuthUserModel, AuthUserEntity> {
  @HiveField(0)
  @JsonKey(name: 'id')
  final String? id;

  @HiveField(1)
  @JsonKey(name: 'full_name')
  final String? fullName;

  @HiveField(2)
  @JsonKey(name: 'english_name')
  String? englishName;

  @HiveField(3)
  @JsonKey(name: 'national_id')
  final String? nationalId;

  @HiveField(4)
  @JsonKey(name: 'email')
  final String? email;

  @HiveField(5)
  @JsonKey(name: 'user_flags')
  final UserFlagsModel? userFlags;

  @HiveField(6)
  @JsonKey(name: 'roles')
  final List<String>? roles;

  @HiveField(7)
  @JsonKey(name: 'profile_picture')
  String? profilePicture;

  @HiveField(8)
  @JsonKey(name: 'updated_at')
  final double? updatedAt;

  @HiveField(9)
  @JsonKey(name: 'status')
  final String? status;

  AuthUserModel(
      {this.email,
      this.englishName,
      this.fullName,
      this.id,
      this.nationalId,
      this.profilePicture,
      this.status,
      this.roles,
      this.updatedAt,
      this.userFlags});

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserModelToJson(this);

  @override
  AuthUserEntity toEntity() => AuthUserEntity(
      id: id,
      nationalId: nationalId,
      fullName: fullName,
      email: email,
      updatedAt: updatedAt,
      englishName: englishName,
      flags: userFlags?.toEntity(),
      status: status,
      roles: roles);
}
