// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             "data",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_cubit.dart';
import 'package:main_platform/app/presentation/bloc/main/app_prefs_cubit.dart';
import 'package:main_platform/app/presentation/bloc/main/app_prefs_state.dart';
import 'package:main_platform/app/presentation/bloc/privacy_settings/privacy_settings_cubit.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/localization/codegen_loader.g.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:main_platform/core/services/hive_service.dart';
import 'package:main_platform/core/themes/dark.dart';
import 'package:main_platform/core/themes/light.dart';
import 'package:main_platform/core/utils/build_mode.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await configureDependencyInjection();

  await getIt.allReady();

  await getIt<HiveService>().init();

  setPathUrlStrategy();

  runApp(
    DevicePreview(
      enabled: !BuildMode.isReleaseMode,
      builder: (BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AppPreferencesCubit>(
              create: (context) => getIt<AppPreferencesCubit>()),
          BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
          BlocProvider<PrivacySettingsCubit>(
            create: (context) => getIt<PrivacySettingsCubit>(),
          )
        ],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => EasyLocalization(
        supportedLocales: const <Locale>[Locale('ar'), Locale('en')],
        fallbackLocale: const Locale('en'),
        path: "assets/translations",
        assetLoader: const CodegenLoader(),
        child: BlocBuilder<AppPreferencesCubit, AppPreferencesState>(
          builder: (context, state) => MaterialApp.router(
            title: 'CAMPUS',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            locale: Locale(state.locale),
            routerConfig: getIt<AppRouter>().config(
                reevaluateListenable:
                    ReevaluateListenable.stream(getIt<AuthCubit>().stream)),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
          ),
        ),
      ),
    );
  }
}
