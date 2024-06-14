import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_exists_response_model.g.dart';

@JsonSerializable()
class UserExistsResponseModel {
  final bool exists;
  const UserExistsResponseModel(this.exists);

  factory UserExistsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserExistsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserExistsResponseModelToJson(this);
}
