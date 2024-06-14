import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/domain/usecase/auth/logout_usecase.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/presentation/bloc/main/app_prefs_cubit.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:main_platform/core/utils/native_locale.dart';
import 'package:main_platform/core/widgets/locale_list_widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  final LogoutUseCase _logoutUseCase = getIt<LogoutUseCase>();

  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.nav_bar_settings.tr(),
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 20),
              const Divider(height: 20, thickness: 1),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.settings_dark_mode.tr(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: context.read<AppPreferencesCubit>().dark,
                    onChanged: (value) {
                      context.read<AppPreferencesCubit>().setDarkMode(value);
                    },
                  ),
                ],
              ),
              Text(
                LocaleKeys.settings_dark_mode_description.tr(),
                style: const TextStyle(fontSize: 13),
              ),
              const Divider(height: 20, thickness: 1),
              buildLanguageSelection(
                  Theme.of(context), LocaleKeys.settings_language.tr()),
              Text(
                LocaleKeys.settings_language_description.tr(),
                style: const TextStyle(fontSize: 13),
              ),
              const Divider(height: 20, thickness: 1),
              InkWell(
                onTap: () {
                  context.router.navigate(const PrivacySettingsRoute());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.privacy_tip),
                      const SizedBox(width: 10),
                      Text(
                        LocaleKeys.privacy_settings_title.tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 20, thickness: 1),
              InkWell(
                onTap: () {
                  widget._logoutUseCase(NoParams()).then((_) {
                    context.router.navigate(const LoginRoute());
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: theme.colorScheme.error),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.settings_logout.tr(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.error),
                          ),
                          Text(
                            LocaleKeys.settings_logout_description.tr(),
                            style: TextStyle(
                                fontSize: 13, color: theme.colorScheme.error),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildLanguageSelection(ThemeData theme, String labelText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
                text: NativeLocale.getNativeLanguageName(
                    Localizations.localeOf(context).languageCode),
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    decorationColor: theme.colorScheme.primary),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) => LocaleListWidget(
                            supportedLocales: context.supportedLocales));
                  })),
      ],
    );
  }
}
