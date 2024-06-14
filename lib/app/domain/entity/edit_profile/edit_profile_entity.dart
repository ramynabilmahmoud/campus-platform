import 'package:image_picker/image_picker.dart';

class EditProfileEntity {
  final String? displayName;
  final XFile? profilePicture;
  final String? bio;
  final String? phone;

  EditProfileEntity({
    this.displayName,
    this.profilePicture,
    this.bio,
    this.phone,
  });
}
