import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/community/create_community_entity.dart';

part 'create_community_request_model.g.dart';

@JsonSerializable()
class CreateCommunityRequestModel
    with EntityConvertible<CreateCommunityRequestModel, CreateCommunityEntity> {
  final String? name;
  final String? description;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final XFile? imageId;

  @JsonKey(name: 'closed')
  final bool? isClosed;

  @JsonKey(name: 'private')
  final bool? isPrivate;

  CreateCommunityRequestModel(
      {this.name,
      this.description,
      this.imageId,
      this.isClosed,
      this.isPrivate});

  factory CreateCommunityRequestModel.fromJson(Map<String, dynamic> json) =>
  _$CreateCommunityRequestModelFromJson(json);

   Map<String, dynamic> toJson() => _$CreateCommunityRequestModelToJson(this);

  factory CreateCommunityRequestModel.fromEntity(
          CreateCommunityEntity createCommunityEntity) =>
      CreateCommunityRequestModel(
        name: createCommunityEntity.name,
        description: createCommunityEntity.description,
        imageId: createCommunityEntity.imageId,
        isClosed: createCommunityEntity.isClosed,
        isPrivate: createCommunityEntity.isPrivate,
      );

  @override
  CreateCommunityEntity toEntity() => CreateCommunityEntity(
        name: name,
        description: description,
        imageId: imageId,
        isClosed: isClosed,
        isPrivate: isPrivate,
      );
}
