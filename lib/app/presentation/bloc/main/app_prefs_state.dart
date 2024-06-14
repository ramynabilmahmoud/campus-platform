import 'package:equatable/equatable.dart';
import 'package:main_platform/core/utils/native_locale.dart';

class AppPreferencesState extends Equatable {
  final bool isDarkMode;
  final String locale;

  const AppPreferencesState({required this.isDarkMode, required this.locale});

  const AppPreferencesState.initial()
      : this(isDarkMode: false, locale: NativeLocale.defaultLocale);

  AppPreferencesState copyWith({bool? dark, String? locale}) {
    return AppPreferencesState(
        isDarkMode: dark ?? isDarkMode, locale: locale ?? this.locale);
  }

  @override
  List<Object?> get props => [isDarkMode, locale];
}
