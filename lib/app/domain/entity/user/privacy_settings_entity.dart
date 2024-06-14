import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_settings_entity.freezed.dart';

@freezed
class PrivacySettingsEntity with _$PrivacySettingsEntity {
  const factory PrivacySettingsEntity(
      {required bool? isPrivateProfile,
      required bool? isAcceptingConnections,
      required bool? isShowingConnectionsCount,
      required bool? isPrivatePhoneNumber,
      required bool? isReceivingPrivateMessages}) = _PrivacySettingsEntity;
}
