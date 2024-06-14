import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flags_entity.freezed.dart';

@freezed
class UserFlagsEntity with _$UserFlagsEntity {
  const factory UserFlagsEntity({
    required bool isEmailVerified,
    required bool isIdentityVerified,
    required bool isKnownStudent,
    required bool isApprovedUser,
    required bool isSuspendedUser,
  }) = _UserFlagsEntity;
}
