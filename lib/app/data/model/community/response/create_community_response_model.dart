import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_community_response_model.g.dart';

@JsonSerializable()
class CreateCommunityResponseModel {
  @JsonKey(name: "community_id")
  final String communityId;

  const CreateCommunityResponseModel(this.communityId);

  factory CreateCommunityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCommunityResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommunityResponseModelToJson(this);
}
