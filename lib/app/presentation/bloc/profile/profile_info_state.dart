import 'package:main_platform/app/domain/entity/profile/profile_info_entity.dart';

abstract class ProfileInfoState {}

class ProfileInfoInitial extends ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoSuccess extends ProfileInfoState {
  final ProfileInfoEntity profile;
  ProfileInfoSuccess(this.profile);
}

class ProfileInfoFailure extends ProfileInfoState {
  final String message;
  ProfileInfoFailure(this.message);
}
