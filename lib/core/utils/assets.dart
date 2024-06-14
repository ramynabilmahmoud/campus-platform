import 'package:main_platform/app/presentation/bloc/main/app_prefs_cubit.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:path/path.dart';

class Assets {
  static String path(String path, {bool isDarkModeAware = false}) {
    final bool isDarkMode =
        isDarkModeAware && getIt<AppPreferencesCubit>().dark;
    return isDarkMode ? join(dirname(path), 'night', basename(path)) : path;
  }
}
