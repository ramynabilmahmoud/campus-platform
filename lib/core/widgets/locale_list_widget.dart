import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/main/app_prefs_cubit.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/utils/native_locale.dart';

class LocaleListWidget extends StatelessWidget {
  final List<Locale> supportedLocales;

  const LocaleListWidget({super.key, required this.supportedLocales});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 200,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              const SizedBox(
                height: 5,
              ),
              Text(LocaleKeys.auth_choose_language.tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                      )),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: supportedLocales.length,
                      itemBuilder: (context, index) {
                        String? native = NativeLocale.getNativeLanguageName(
                            supportedLocales[index].languageCode);
                        native ??= supportedLocales[index].languageCode;
                        return ListTile(
                          title: Center(
                              child: Text(
                            native,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )),
                          onTap: () {
                            context
                                .read<AppPreferencesCubit>()
                                .setLocale(supportedLocales[index]);
                            context.setLocale(supportedLocales[index]);
                            EasyLocalization.of(context)
                                ?.setLocale(supportedLocales[index]);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider()))
            ])));
  }
}

// AlertDialog(
//         title: Container(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
                  //   child: Text(
                  // LocaleKeys.auth_choose_language.tr(),
                  // style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  //       fontWeight: FontWeight.w900,
                  //     ),
//                 )),
//                 IconButton(
//                   icon: Icon(Icons.close,
//                       color: Theme.of(context).colorScheme.onBackground),
//                   onPressed: () => Navigator.of(context).pop(),
//                 )
//               ],
//             )),
//         content: 
