import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main_platform/app/data/datasource/mappers/entity_convertable.dart';
import 'package:main_platform/app/domain/entity/user/privacy_settings_entity.dart';
import 'package:main_platform/core/constants/hive_consts.dart';

part 'privacy_settings_model.g.dart';

@HiveType(typeId: HiveTypes.privacySettingsModel)
@JsonSerializable()
class PrivacySettingsModel
    with EntityConvertible<PrivacySettingsModel, PrivacySettingsEntity> {
  @HiveField(0)
  @JsonKey(name: 'private_profile')
  final bool? isPrivateProfile;

  @HiveField(1)
  @JsonKey(name: 'accepting_connections')
  final bool? isAcceptingConnections;

  @HiveField(2)
  @JsonKey(name: 'show_connections_count')
  final bool? isShowingConnectionsCount;

  @HiveField(3)
  @JsonKey(name: 'private_phone_number')
  final bool? isPrivatePhoneNumber;

  @HiveField(4)
  @JsonKey(name: 'receive_private_messages')
  final bool? isReceivingPrivateMessages;

  const PrivacySettingsModel(
      {this.isPrivatePhoneNumber,
      this.isAcceptingConnections,
      this.isShowingConnectionsCount,
      this.isPrivateProfile,
      this.isReceivingPrivateMessages});

  factory PrivacySettingsModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacySettingsModelToJson(this);

  @override
  PrivacySettingsModel fromEntity(PrivacySettingsEntity model) =>
      PrivacySettingsModel(
          isPrivateProfile: model.isPrivateProfile,
          isAcceptingConnections: model.isAcceptingConnections,
          isShowingConnectionsCount: model.isShowingConnectionsCount,
          isPrivatePhoneNumber: model.isPrivatePhoneNumber,
          isReceivingPrivateMessages: model.isReceivingPrivateMessages);

  @override
  PrivacySettingsEntity toEntity() => PrivacySettingsEntity(
      isPrivateProfile: isPrivateProfile,
      isAcceptingConnections: isAcceptingConnections,
      isShowingConnectionsCount: isShowingConnectionsCount,
      isPrivatePhoneNumber: isPrivatePhoneNumber,
      isReceivingPrivateMessages: isReceivingPrivateMessages);
}
