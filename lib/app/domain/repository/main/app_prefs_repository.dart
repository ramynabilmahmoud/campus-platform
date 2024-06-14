abstract interface class AppPreferencesRepository {
  Future<String> getLocale();

  Future<void> setLocale(String locale);

  Future<bool> isDarkMode();

  Future<void> setDarkMode(bool value);
}
