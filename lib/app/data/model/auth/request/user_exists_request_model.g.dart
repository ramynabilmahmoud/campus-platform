// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_exists_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserExistsRequestModel _$UserExistsRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserExistsRequestModel(
      filterKey: $enumDecode(_$UserExistsFilterKeyEnumMap, json['filter_key']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$UserExistsRequestModelToJson(
        UserExistsRequestModel instance) =>
    <String, dynamic>{
      'filter_key': _$UserExistsFilterKeyEnumMap[instance.filterKey]!,
      'value': instance.value,
    };

const _$UserExistsFilterKeyEnumMap = {
  UserExistsFilterKey.email: 'email',
  UserExistsFilterKey.nationalId: 'nationalId',
  UserExistsFilterKey.studentCode: 'studentCode',
};
