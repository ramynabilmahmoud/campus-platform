import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_model.g.dart';

@JsonSerializable()
class EditProfileResponseModel {
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'message')
  final String message;

  EditProfileResponseModel({required this.success, required this.message});

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseModelToJson(this);
}
