import 'package:flutter/foundation.dart'
    show kDebugMode, kReleaseMode, kProfileMode;

abstract class BuildMode {
  static const bool isDebugMode = kDebugMode;

  static const bool isReleaseMode = kReleaseMode;

  static const bool isProfileMode = kProfileMode;
}
