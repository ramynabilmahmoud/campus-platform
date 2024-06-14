const collectionName = 'campusdb';

class HiveBoxes {
  static const String preferences = 'preferences';
  static const String auth = 'auth_preferences';
  static const String user = 'user_preferences';
  static const String programs = 'programs';
}

class HiveTypes {
  static const int userModel = 0;
  static const int userFlags = 1;
  static const int privacySettingsModel = 2;
  static const int settingsModel = 3;
  static const int programModel = 4;
  static const int studentInfoModel = 5;
  static const int profileInfoModel = 5;

}

const boxes = [
  HiveBoxes.preferences,
  HiveBoxes.auth,
  HiveBoxes.user,
  HiveBoxes.programs
];
