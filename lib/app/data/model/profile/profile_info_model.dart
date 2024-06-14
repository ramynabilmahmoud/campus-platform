import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:main_platform/app/domain/entity/profile/profile_info_entity.dart';
import 'package:main_platform/core/constants/hive_consts.dart';
import 'package:main_platform/core/utils/data_mapper.dart';

part 'profile_info_model.g.dart';

@HiveType(typeId: HiveTypes.profileInfoModel)
@JsonSerializable()
class ProfileInfoModel extends DataMapper<ProfileInfoEntity> {
  @HiveField(0)
  @JsonKey(name: 'full_name')
  final String? fullName;

  @HiveField(1)
  @JsonKey(name: 'display_name')
  final String? displayName;

  @HiveField(2)
  final bool? self;

  @HiveField(3)
  final int? connections;

  @HiveField(4)
  final String? title;

  @HiveField(5)
  final String? bio;

  @HiveField(6)
  final String? phone;

  @HiveField(7)
  final ConnectionStatusModel? connection;

  @HiveField(8)
  final String? avatar;

  @HiveField(9)
  @JsonKey(name: 'student_info')
  final ProfileStudentInfoModel? studentInfo;

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileInfoModelToJson(this);

  ProfileInfoModel(
      {required this.fullName,
      required this.displayName,
      required this.self,
      required this.connections,
      required this.title,
      required this.bio,
      required this.phone,
      required this.connection,
      required this.avatar,
      required this.studentInfo});

  @override
  ProfileInfoEntity toEntity() {
    return ProfileInfoEntity(
      fullName: fullName,
      displayName: displayName,
      self: self,
      connections: connections,
      title: title,
      bio: bio,
      phone: phone,
      connection: connection?.toEntity(),
      avatar: avatar,
      studentInfo: studentInfo?.toEntity(),
    );
  }
}

@HiveType(typeId: HiveTypes.studentInfoModel)
@JsonSerializable()
class ProfileStudentInfoModel extends DataMapper<ProfileStudentInfoEntity> {
  @HiveField(0)
  @JsonKey(name: 'section')
  final int section;

  @HiveField(1)
  @JsonKey(name: 'program')
  final String program;

  @HiveField(2)
  @JsonKey(name: 'semester')
  final int semester;

  @HiveField(3)
  @JsonKey(name: 'student_code')
  final int studentCode;

  ProfileStudentInfoModel({
    required this.section,
    required this.program,
    required this.semester,
    required this.studentCode,
  });

  factory ProfileStudentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileStudentInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileStudentInfoModelToJson(this);

  @override
  ProfileStudentInfoEntity toEntity() {
    return ProfileStudentInfoEntity(
      section: section,
      program: program,
      semester: semester,
      studentCode: studentCode,
    );
  }
}

enum UserConnectionStatus { none, connected, declined, pending }

@JsonSerializable()
class ConnectionStatusModel extends DataMapper<ConnectionStatusEntity> {
  final UserConnectionStatus status;
  final bool sender;

  ConnectionStatusModel({
    required this.status,
    required this.sender,
  });

  factory ConnectionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionStatusModelToJson(this);

  @override
  ConnectionStatusEntity toEntity() {
    return ConnectionStatusEntity(
      status: status,
      sender: sender,
    );
  }
}
