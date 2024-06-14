import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/auth/signup_entity.dart';
import 'package:main_platform/app/presentation/bloc/signup/signup_cubit.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel
    with EntityConvertible<SignUpRequestModel, SignUpEntity> {
  final String? email;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'national_id')
  final String? nationalId;

  final String? password;

  final SignUpRole? role;

  const SignUpRequestModel(
      {this.email, this.fullName, this.nationalId, this.password, this.role});

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  @override
  SignUpRequestModel fromEntity(SignUpEntity model) => SignUpRequestModel(
      email: model.email,
      fullName: model.fullName,
      nationalId: model.nationalId,
      password: model.password,
      role: model.role);

  @override
  SignUpEntity toEntity() => SignUpEntity(
      email: email,
      fullName: fullName,
      nationalId: nationalId,
      password: password,
      role: role);
}
