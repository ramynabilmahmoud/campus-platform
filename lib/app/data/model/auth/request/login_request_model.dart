import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/auth/login_entity.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel with EntityConvertible<LoginRequestModel, LoginEntity> {
  final String? identifier;

  final String? password;

  const LoginRequestModel({this.identifier, this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  @override
  LoginRequestModel fromEntity(LoginEntity model) =>
      LoginRequestModel(identifier: model.identifier, password: model.password);

  @override
  LoginEntity toEntity() =>
      LoginEntity(identifier: identifier, password: password);
}
