import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_avatar_widget.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                      LocaleKeys.home_welcome.tr(namedArgs: {
                        'name': getIt<AuthCache>().shortenDisplayName
                      }),
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w900)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        context.router.navigate(ProfileViewRoute(
                            userId: getIt<AuthCache>().user!.id.toString()));
                      },
                      child: CustomAvatarWidget(
                        avatarUrl: getIt<AuthCache>().user!.profilePicture,
                        iconSize: 50,
                      ))
                ],
              )
            ],
          )),
    );
  }
}
