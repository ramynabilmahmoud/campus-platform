import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/domain/usecase/profile/get_profile_info_usecase.dart';
import 'package:main_platform/app/presentation/bloc/profile/profile_info_state.dart';
import 'package:main_platform/core/di/di.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoInitial());

  Future<void> getProfileInfo(String userId) async {
    emit(ProfileInfoLoading());
    final result = await getIt<GetProfileInfoUseCase>().call(userId);
    result.fold(
      (failure) => emit(ProfileInfoFailure(failure.message)),
      (profile) => emit(ProfileInfoSuccess(profile)),
    );
  }
}
