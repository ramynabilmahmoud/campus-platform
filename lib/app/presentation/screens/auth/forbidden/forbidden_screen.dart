import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

@RoutePage()
class ForbiddenScreen extends StatefulWidget {
  const ForbiddenScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForbiddenScreen();
}

class _ForbiddenScreen extends State<ForbiddenScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500)).then((_) =>
          showCustomDialog(
              context: context,
              title: LocaleKeys.forbidden.tr(),
              content: [
                Text(LocaleKeys.forbidden_page.tr())
              ],
              actions: [
                TextButton(
                  child: Text(LocaleKeys.nav_bar_home.tr()),
                  onPressed: () => context.router.replace(HomeRoute()),
                )
              ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
