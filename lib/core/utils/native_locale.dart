class NativeLocale {
  static const String defaultLocale = 'en';
  static const Map<String, Map<String, String>> isoLanguages = {
    'ar': {"name": "Arabic", "native": "العربية", "icon": "🇪🇬"},
    'en': {"name": "English", "native": "English", "icon": "🇬🇧"},
  };

  static String? getNativeLanguageName(String code) {
    if (isoLanguages.containsKey(code)) {
      return isoLanguages[code]!['native'];
    }
    return null;
  }
}
