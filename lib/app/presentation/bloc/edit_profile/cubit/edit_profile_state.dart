
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileUpdated extends EditProfileState {
  final String response;
  EditProfileUpdated(this.response);
}

class EditProfileError extends EditProfileState {
  final String error;
  EditProfileError(this.error);
}
