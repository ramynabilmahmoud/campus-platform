import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel
    with EntityConvertible<LoginResponseModel, UserAuthTokensEntity> {
  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  const LoginResponseModel({this.accessToken, this.refreshToken});

  @override
  LoginResponseModel fromEntity(UserAuthTokensEntity model) =>
      LoginResponseModel(
          accessToken: model.accessToken, refreshToken: model.refreshToken);

  @override
  UserAuthTokensEntity toEntity() => UserAuthTokensEntity(
      accessToken: accessToken, refreshToken: refreshToken);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
