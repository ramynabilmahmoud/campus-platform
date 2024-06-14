// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileInfoModelAdapter extends TypeAdapter<ProfileInfoModel> {
  @override
  final int typeId = 5;

  @override
  ProfileInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileInfoModel(
      fullName: fields[0] as String?,
      displayName: fields[1] as String?,
      self: fields[2] as bool?,
      connections: fields[3] as int?,
      title: fields[4] as String?,
      bio: fields[5] as String?,
      phone: fields[6] as String?,
      connection: fields[7] as ConnectionStatusModel?,
      avatar: fields[8] as String?,
      studentInfo: fields[9] as ProfileStudentInfoModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileInfoModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.displayName)
      ..writeByte(2)
      ..write(obj.self)
      ..writeByte(3)
      ..write(obj.connections)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.bio)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.connection)
      ..writeByte(8)
      ..write(obj.avatar)
      ..writeByte(9)
      ..write(obj.studentInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfileStudentInfoModelAdapter
    extends TypeAdapter<ProfileStudentInfoModel> {
  @override
  final int typeId = 5;

  @override
  ProfileStudentInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileStudentInfoModel(
      section: fields[0] as int,
      program: fields[1] as String,
      semester: fields[2] as int,
      studentCode: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileStudentInfoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.section)
      ..writeByte(1)
      ..write(obj.program)
      ..writeByte(2)
      ..write(obj.semester)
      ..writeByte(3)
      ..write(obj.studentCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileStudentInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfoModel _$ProfileInfoModelFromJson(Map<String, dynamic> json) =>
    ProfileInfoModel(
      fullName: json['full_name'] as String?,
      displayName: json['display_name'] as String?,
      self: json['self'] as bool?,
      connections: (json['connections'] as num?)?.toInt(),
      title: json['title'] as String?,
      bio: json['bio'] as String?,
      phone: json['phone'] as String?,
      connection: json['connection'] == null
          ? null
          : ConnectionStatusModel.fromJson(
              json['connection'] as Map<String, dynamic>),
      avatar: json['avatar'] as String?,
      studentInfo: json['student_info'] == null
          ? null
          : ProfileStudentInfoModel.fromJson(
              json['student_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileInfoModelToJson(ProfileInfoModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'display_name': instance.displayName,
      'self': instance.self,
      'connections': instance.connections,
      'title': instance.title,
      'bio': instance.bio,
      'phone': instance.phone,
      'connection': instance.connection,
      'avatar': instance.avatar,
      'student_info': instance.studentInfo,
    };

ProfileStudentInfoModel _$ProfileStudentInfoModelFromJson(
        Map<String, dynamic> json) =>
    ProfileStudentInfoModel(
      section: (json['section'] as num).toInt(),
      program: json['program'] as String,
      semester: (json['semester'] as num).toInt(),
      studentCode: (json['student_code'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileStudentInfoModelToJson(
        ProfileStudentInfoModel instance) =>
    <String, dynamic>{
      'section': instance.section,
      'program': instance.program,
      'semester': instance.semester,
      'student_code': instance.studentCode,
    };

ConnectionStatusModel _$ConnectionStatusModelFromJson(
        Map<String, dynamic> json) =>
    ConnectionStatusModel(
      status: $enumDecode(_$UserConnectionStatusEnumMap, json['status']),
      sender: json['sender'] as bool,
    );

Map<String, dynamic> _$ConnectionStatusModelToJson(
        ConnectionStatusModel instance) =>
    <String, dynamic>{
      'status': _$UserConnectionStatusEnumMap[instance.status]!,
      'sender': instance.sender,
    };

const _$UserConnectionStatusEnumMap = {
  UserConnectionStatus.none: 'none',
  UserConnectionStatus.connected: 'connected',
  UserConnectionStatus.declined: 'declined',
  UserConnectionStatus.pending: 'pending',
};
