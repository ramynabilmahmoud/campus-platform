// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserModelAdapter extends TypeAdapter<AuthUserModel> {
  @override
  final int typeId = 0;

  @override
  AuthUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthUserModel(
      email: fields[4] as String?,
      englishName: fields[2] as String?,
      fullName: fields[1] as String?,
      id: fields[0] as String?,
      nationalId: fields[3] as String?,
      profilePicture: fields[7] as String?,
      status: fields[9] as String?,
      roles: (fields[6] as List?)?.cast<String>(),
      updatedAt: fields[8] as double?,
      userFlags: fields[5] as UserFlagsModel?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.nationalId)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.userFlags)
      ..writeByte(6)
      ..write(obj.roles)
      ..writeByte(7)
      ..write(obj.profilePicture)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) =>
    AuthUserModel(
      email: json['email'] as String?,
      englishName: json['english_name'] as String?,
      fullName: json['full_name'] as String?,
      id: json['id'] as String?,
      nationalId: json['national_id'] as String?,
      profilePicture: json['profile_picture'] as String?,
      status: json['status'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      updatedAt: (json['updated_at'] as num?)?.toDouble(),
      userFlags: json['user_flags'] == null
          ? null
          : UserFlagsModel.fromJson(json['user_flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthUserModelToJson(AuthUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'english_name': instance.englishName,
      'national_id': instance.nationalId,
      'email': instance.email,
      'user_flags': instance.userFlags,
      'roles': instance.roles,
      'profile_picture': instance.profilePicture,
      'updated_at': instance.updatedAt,
      'status': instance.status,
    };
