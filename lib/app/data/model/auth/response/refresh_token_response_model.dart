import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';

part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponseModel
    with EntityConvertible<RefreshTokenResponseModel, UserAuthTokensEntity> {
  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  const RefreshTokenResponseModel({this.accessToken, this.refreshToken});

  @override
  RefreshTokenResponseModel fromEntity(UserAuthTokensEntity model) =>
      RefreshTokenResponseModel(
          accessToken: model.accessToken, refreshToken: model.refreshToken);

  @override
  UserAuthTokensEntity toEntity() => UserAuthTokensEntity(
      accessToken: accessToken, refreshToken: refreshToken);

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseModelToJson(this);
}
