import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';

part 'user_exists_request_model.g.dart';

@JsonSerializable()
class UserExistsRequestModel {
  @JsonKey(name: 'filter_key')
  final UserExistsFilterKey filterKey;
  final String value;

  const UserExistsRequestModel({required this.filterKey, required this.value});

  factory UserExistsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserExistsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserExistsRequestModelToJson(this);
}
