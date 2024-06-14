// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_flags_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserFlagsModelAdapter extends TypeAdapter<UserFlagsModel> {
  @override
  final int typeId = 1;

  @override
  UserFlagsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserFlagsModel(
      isEmailVerified: fields[0] as bool,
      isIdentityVerified: fields[1] as bool,
      isKnownStudent: fields[4] as bool,
      isApprovedUser: fields[2] as bool,
      isSuspendedUser: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserFlagsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.isEmailVerified)
      ..writeByte(1)
      ..write(obj.isIdentityVerified)
      ..writeByte(2)
      ..write(obj.isApprovedUser)
      ..writeByte(3)
      ..write(obj.isSuspendedUser)
      ..writeByte(4)
      ..write(obj.isKnownStudent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserFlagsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFlagsModel _$UserFlagsModelFromJson(Map<String, dynamic> json) =>
    UserFlagsModel(
      isEmailVerified: json['email_verified'] as bool,
      isIdentityVerified: json['identity_verified'] as bool,
      isKnownStudent: json['known_student'] as bool,
      isApprovedUser: json['approved'] as bool,
      isSuspendedUser: json['suspended'] as bool,
    );

Map<String, dynamic> _$UserFlagsModelToJson(UserFlagsModel instance) =>
    <String, dynamic>{
      'email_verified': instance.isEmailVerified,
      'identity_verified': instance.isIdentityVerified,
      'approved': instance.isApprovedUser,
      'suspended': instance.isSuspendedUser,
      'known_student': instance.isKnownStudent,
    };
