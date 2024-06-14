// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrivacySettingsModelAdapter extends TypeAdapter<PrivacySettingsModel> {
  @override
  final int typeId = 2;

  @override
  PrivacySettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrivacySettingsModel(
      isPrivatePhoneNumber: fields[3] as bool?,
      isAcceptingConnections: fields[1] as bool?,
      isShowingConnectionsCount: fields[2] as bool?,
      isPrivateProfile: fields[0] as bool?,
      isReceivingPrivateMessages: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PrivacySettingsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.isPrivateProfile)
      ..writeByte(1)
      ..write(obj.isAcceptingConnections)
      ..writeByte(2)
      ..write(obj.isShowingConnectionsCount)
      ..writeByte(3)
      ..write(obj.isPrivatePhoneNumber)
      ..writeByte(4)
      ..write(obj.isReceivingPrivateMessages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrivacySettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacySettingsModel _$PrivacySettingsModelFromJson(
        Map<String, dynamic> json) =>
    PrivacySettingsModel(
      isPrivatePhoneNumber: json['private_phone_number'] as bool?,
      isAcceptingConnections: json['accepting_connections'] as bool?,
      isShowingConnectionsCount: json['show_connections_count'] as bool?,
      isPrivateProfile: json['private_profile'] as bool?,
      isReceivingPrivateMessages: json['receive_private_messages'] as bool?,
    );

Map<String, dynamic> _$PrivacySettingsModelToJson(
        PrivacySettingsModel instance) =>
    <String, dynamic>{
      'private_profile': instance.isPrivateProfile,
      'accepting_connections': instance.isAcceptingConnections,
      'show_connections_count': instance.isShowingConnectionsCount,
      'private_phone_number': instance.isPrivatePhoneNumber,
      'receive_private_messages': instance.isReceivingPrivateMessages,
    };
