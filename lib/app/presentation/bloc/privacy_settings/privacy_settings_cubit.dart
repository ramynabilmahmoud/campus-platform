import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/domain/usecase/user/get_privacy_settings_usecase.dart';
import 'package:main_platform/app/domain/usecase/user/set_privacy_settings_usecase.dart';
import 'package:main_platform/app/presentation/bloc/privacy_settings/privacy_settings_state.dart';
import 'package:main_platform/core/di/di.dart';

@injectable
class PrivacySettingsCubit extends Cubit<PrivacySettingsState> {
  final GetPrivacySettingsUseCase _getPrivacySettingsUseCase =
      getIt<GetPrivacySettingsUseCase>();
  final SetPrivacySettingsUseCase _setPrivacySettingsUseCase =
      getIt<SetPrivacySettingsUseCase>();
  PrivacySettingsCubit() : super(const PrivacySettingsState());

  void showLoading() {
    emit(state.copyWith(status: PrivacySettingsStatus.loading));
  }

  void updatePrivateProfile(bool value) => emit(
      state.copyWith(entity: state.entity.copyWith(isPrivateProfile: value)));

  void updateAcceptingConnections(bool value) => emit(state.copyWith(
      entity: state.entity.copyWith(isAcceptingConnections: value)));

  void updateShowConnectionsCount(bool value) => emit(state.copyWith(
      entity: state.entity.copyWith(isShowingConnectionsCount: value)));

  void updatePhoneNumber(bool value) => emit(state.copyWith(
      entity: state.entity.copyWith(isPrivatePhoneNumber: value)));

  void updateReceivingPrivateMessage(bool value) => emit(state.copyWith(
      entity: state.entity.copyWith(isReceivingPrivateMessages: value)));

  void saveSettings() async {
    emit(state.copyWith(status: PrivacySettingsStatus.loading));

    var res = await _setPrivacySettingsUseCase(state.entity);
    res.fold((error) {
      emit(state.copyWith(status: PrivacySettingsStatus.error, error: error));
    }, (_) {
      emit(state.copyWith(status: PrivacySettingsStatus.done));
    });
  }

  Future<void> loadSettings() async {
    emit(state.copyWith(status: PrivacySettingsStatus.loading));

    var res = await _getPrivacySettingsUseCase(NoParams());
    res.fold((error) {
      emit(state.copyWith(status: PrivacySettingsStatus.error, error: error));
    }, (entity) {
      emit(state.copyWith(status: PrivacySettingsStatus.done, entity: entity));
    });
  }
}
