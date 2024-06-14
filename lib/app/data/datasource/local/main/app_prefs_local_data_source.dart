abstract interface class AppPreferencesLocalDataSource {
  const AppPreferencesLocalDataSource();

  Future<String> getLocale();

  Future<void> setLocale(String locale);

  Future<bool> isDarkMode();

  Future<void> setDarkMode(bool dark);
}
