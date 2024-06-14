import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/auth/user_flags_entity.dart';
import 'package:main_platform/core/constants/hive_consts.dart';

part 'user_flags_model.g.dart';

@HiveType(typeId: HiveTypes.userFlags)
@JsonSerializable()
class UserFlagsModel with EntityConvertible<UserFlagsModel, UserFlagsEntity> {
  @HiveField(0)
  @JsonKey(name: 'email_verified')
  final bool isEmailVerified;

  @HiveField(1)
  @JsonKey(name: 'identity_verified')
  final bool isIdentityVerified;

  @HiveField(2)
  @JsonKey(name: 'approved')
  final bool isApprovedUser;

  @HiveField(3)
  @JsonKey(name: 'suspended')
  final bool isSuspendedUser;

  @HiveField(4)
  @JsonKey(name: 'known_student')
  final bool isKnownStudent;

  UserFlagsModel({
    required this.isEmailVerified,
    required this.isIdentityVerified,
    required this.isKnownStudent,
    required this.isApprovedUser,
    required this.isSuspendedUser,
  });

  factory UserFlagsModel.fromJson(Map<String, dynamic> json) =>
      _$UserFlagsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserFlagsModelToJson(this);

  @override
  UserFlagsEntity toEntity() {
    return UserFlagsEntity(
      isEmailVerified: isEmailVerified,
      isIdentityVerified: isIdentityVerified,
      isApprovedUser: isApprovedUser,
      isKnownStudent: isKnownStudent,
      isSuspendedUser: isSuspendedUser,
    );
  }
}
