import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';
import 'package:main_platform/app/domain/usecase/edit_profile/edit_profile_usecase.dart';
import 'package:main_platform/app/presentation/bloc/edit_profile/cubit/edit_profile_state.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  final EditProfileUseCase _editProfileUseCase = getIt<EditProfileUseCase>();
  void editProfile(EditProfileEntity profileEntity) async {
    emit(EditProfileLoading());
    try {
      final Either<Failure, bool> result =
          await _editProfileUseCase.call(profileEntity);
      result.fold(
        (failure) => emit(EditProfileError(failure.message)),
        (success) {
          if (success) {
            emit(EditProfileUpdated("Profile updated successfully"));
          } else {
            emit(EditProfileError("Failed to update profile"));
          }
        },
      );
    } catch (e) {
      emit(EditProfileError("Unexpected error: ${e.toString()}"));
    }
  }

}
