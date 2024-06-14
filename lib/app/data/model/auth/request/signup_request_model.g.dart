// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      nationalId: json['national_id'] as String?,
      password: json['password'] as String?,
      role: $enumDecodeNullable(_$SignUpRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'full_name': instance.fullName,
      'national_id': instance.nationalId,
      'password': instance.password,
      'role': _$SignUpRoleEnumMap[instance.role],
    };

const _$SignUpRoleEnumMap = {
  SignUpRole.student: 'student',
  SignUpRole.professor: 'professor',
  SignUpRole.instructor: 'instructor',
  SignUpRole.employee: 'employee',
};
