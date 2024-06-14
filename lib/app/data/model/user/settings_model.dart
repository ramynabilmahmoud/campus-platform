import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main_platform/core/constants/hive_consts.dart';

part 'settings_model.g.dart';

@HiveType(typeId: HiveTypes.settingsModel)
@JsonSerializable()
class SettingsModel {
  @HiveField(0)
  final bool? dark;

  @HiveField(1)
  final String? locale;

  const SettingsModel({this.dark, this.locale});

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);
}
