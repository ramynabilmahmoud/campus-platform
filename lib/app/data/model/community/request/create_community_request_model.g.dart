// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_community_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommunityRequestModel _$CreateCommunityRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateCommunityRequestModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      isClosed: json['closed'] as bool?,
      isPrivate: json['private'] as bool?,
    );

Map<String, dynamic> _$CreateCommunityRequestModelToJson(
        CreateCommunityRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'closed': instance.isClosed,
      'private': instance.isPrivate,
    };
