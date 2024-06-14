import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/model/auth/user_auth_model.dart';
import 'package:main_platform/app/data/model/auth/user_flags_model.dart';
import 'package:main_platform/app/data/model/program/program_model.dart';
import 'package:main_platform/app/data/model/user/privacy_settings_model.dart';
import 'package:main_platform/core/constants/hive_consts.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/services/secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

@lazySingleton
class HiveService {
  const HiveService();

  @preResolve
  @factoryMethod
  static Future<HiveService> create() async {
    String dir = './';
    if (!kIsWeb) {
      dir = (await getApplicationDocumentsDirectory()).path;
    }

    Hive.init(dir);

    return const HiveService();
  }

  Future<void> initAdapters() async {
    Hive.registerAdapter(AuthUserModelAdapter());
    Hive.registerAdapter(UserFlagsModelAdapter());
    Hive.registerAdapter(PrivacySettingsModelAdapter());
    Hive.registerAdapter(ProgramModelAdapter());
  }

  Future<void> init() async {
    List<int> encryptionKey =
        await getIt<CampusSecureStorage>().getHiveEncryptionKey();

    for (String box in boxes) {
      await Hive.openBox(box, encryptionCipher: HiveAesCipher(encryptionKey));
    }

    await Hive.initFlutter();

    await initAdapters();
  }
}
