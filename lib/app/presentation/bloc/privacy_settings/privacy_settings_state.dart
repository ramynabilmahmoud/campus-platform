import 'package:main_platform/app/domain/entity/user/privacy_settings_entity.dart';
import 'package:main_platform/core/error/failure.dart';

enum PrivacySettingsStatus { loading, error, initial, done }

class PrivacySettingsState {
  static const PrivacySettingsEntity defaultEntity = PrivacySettingsEntity(
      isPrivateProfile: false,
      isAcceptingConnections: true,
      isPrivatePhoneNumber: true,
      isReceivingPrivateMessages: true,
      isShowingConnectionsCount: true);

  final PrivacySettingsEntity entity;
  final PrivacySettingsStatus status;
  final Failure? error;

  const PrivacySettingsState(
      {this.entity = PrivacySettingsState.defaultEntity,
      this.status = PrivacySettingsStatus.initial,
      this.error});

  PrivacySettingsState copyWith(
      {PrivacySettingsEntity? entity,
      PrivacySettingsStatus? status,
      Failure? error}) {
        // print(entity, this)
    return PrivacySettingsState(
        entity: entity ?? this.entity,
        status: status ?? this.status,
        error: error ?? this.error);
  }
}
