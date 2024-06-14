// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestModel _$EditProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestModel(
      englishName: json['english_name'] as String?,
      phone: json['phone'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestModelToJson(
        EditProfileRequestModel instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'phone': instance.phone,
      'bio': instance.bio,
    };
