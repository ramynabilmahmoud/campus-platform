import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';

abstract interface class EditProfileRemoteDataSource {
  Future<bool> editProfile(EditProfileEntity editProfileEntity);
}
