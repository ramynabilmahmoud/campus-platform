import 'package:equatable/equatable.dart';
import 'package:main_platform/app/data/model/profile/profile_info_model.dart';

class ProfileInfoEntity extends Equatable {
  final String? fullName;
  final String? displayName;
  final bool? self;
  final int? connections;
  final String? title;
  final String? bio;
  final String? phone;
  final ConnectionStatusEntity? connection;
  final String? avatar;
  final ProfileStudentInfoEntity? studentInfo;

  const ProfileInfoEntity(
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
  List<Object?> get props => [
        fullName,
        displayName,
        self,
        connections,
        title,
        bio,
        phone,
        connection,
        avatar,
        studentInfo
      ];
}

class ProfileStudentInfoEntity extends Equatable {
  final int section;
  final String program;
  final int semester;
  final int studentCode;

  const ProfileStudentInfoEntity({
    required this.section,
    required this.program,
    required this.semester,
    required this.studentCode,
  });

  @override
  List<Object?> get props => [
        section,
        program,
        semester,
        studentCode,
      ];
}

class ConnectionStatusEntity extends Equatable {
  final UserConnectionStatus status;
  final bool sender;

  const ConnectionStatusEntity({required this.status, required this.sender});

  @override
  List<Object?> get props => [
        status,
        sender,
      ];
}
