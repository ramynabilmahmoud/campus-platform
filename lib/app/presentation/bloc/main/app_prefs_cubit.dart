import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/domain/usecase/main/get_dark_mode_usecase.dart';
import 'package:main_platform/app/domain/usecase/main/get_locale_usecase.dart';
import 'package:main_platform/app/domain/usecase/main/set_dark_mode_usecase.dart';
import 'package:main_platform/app/domain/usecase/main/set_locale_usecase.dart';
import 'package:main_platform/app/presentation/bloc/main/app_prefs_state.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class AppPreferencesCubit extends Cubit<AppPreferencesState> {
  AppPreferencesCubit() : super(const AppPreferencesState.initial()) {
    fetch();
  }

  bool get dark => state.isDarkMode;
  String get locale => state.locale;

  Future<bool> isDarkMode() async {
    bool isDarkMode = await getIt<GetDarkModeUseCase>()(NoParams());
    return isDarkMode;
  }

  Future<void> setDarkMode(bool value) async {
    getIt<SetDarkModeUseCase>()(value);
    emit(state.copyWith(dark: value));
  }

  Future<void> fetchDarkMode() async {
    bool isDarkMode = await getIt<GetDarkModeUseCase>()(NoParams());
    emit(state.copyWith(dark: isDarkMode));
  }

  Future<void> setLocale(Locale locale) async {
    getIt<SetLocaleUseCase>()(locale.languageCode);
    emit(state.copyWith(locale: locale.languageCode));
  }

  Future<String> getLocale() async {
    String locale = await getIt<GetLocaleUseCase>()(NoParams());
    return locale;
  }

  Future<void> fetchLocale() async {
    String locale = await getIt<GetLocaleUseCase>()(NoParams());
    emit(state.copyWith(locale: locale));
  }

  Future<void> toggleDarkMode() async {
    await setDarkMode(!state.isDarkMode);
  }

  Future<void> fetch() async {
    await fetchDarkMode();
    await fetchLocale();
  }
}
