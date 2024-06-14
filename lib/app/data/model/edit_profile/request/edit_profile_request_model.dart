import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';

part 'edit_profile_request_model.g.dart';

@JsonSerializable()
class EditProfileRequestModel
    with EntityConvertible<EditProfileRequestModel, EditProfileEntity> {
  @JsonKey(name: 'english_name')
  final String? englishName;
  final String? phone;
  final String? bio;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final XFile? profilePicture;

  EditProfileRequestModel({
    this.englishName,
    this.phone,
    this.profilePicture,
    this.bio,
  });

  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);

  @override
  EditProfileRequestModel fromEntity(EditProfileEntity model) =>
      EditProfileRequestModel(
        englishName: model.displayName,
        profilePicture: model.profilePicture,
        bio: model.bio,
        phone:model.phone,
      );

  @override
  EditProfileEntity toEntity() => EditProfileEntity(
        displayName: englishName,
        profilePicture: profilePicture,
        bio: bio,
        phone:phone,
      );
}
