import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_platform/app/domain/entity/auth/user_flags_entity.dart';

part 'user_entity.freezed.dart';

@freezed
class AuthUserEntity with _$AuthUserEntity {
  const factory AuthUserEntity(
      {required String? id,
      required String? fullName,
      required String? nationalId,
      required String? email,
      required double? updatedAt,
      required UserFlagsEntity? flags,
      required List<String>? roles,
      required String? status,
      String? englishName,
      String? profilePicture}) = _AuthUserEntity;
}
