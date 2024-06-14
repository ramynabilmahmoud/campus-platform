import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/core/constants/secure_storage.dart';

@lazySingleton
class CampusSecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<int>> resetHiveEncryptionKey() async {
    List<int> encryptionKeyRaw = Hive.generateSecureKey();
    String encryptionKey = base64.encode(encryptionKeyRaw);

    await _storage.write(
        key: SecureStorageKeys.hiveEncryptionKey, value: encryptionKey);

    return encryptionKeyRaw;
  }

  Future<List<int>> getHiveEncryptionKey() async {
    bool keyExists =
        await _storage.containsKey(key: SecureStorageKeys.hiveEncryptionKey);
    if (!keyExists) {
      return await resetHiveEncryptionKey();
    } else {
      String? encryptionKeyRaw =
          await _storage.read(key: SecureStorageKeys.hiveEncryptionKey);

      if (encryptionKeyRaw == null) {
        return await resetHiveEncryptionKey();
      } else {
        return base64Url.decode(encryptionKeyRaw);
      }
    }
  }
}
