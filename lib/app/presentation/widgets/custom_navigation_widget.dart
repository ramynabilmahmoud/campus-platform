import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/presentation/widgets/custom_bottom_bar.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';

final navigationItems = [
  const CustomBottomBarItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      route: HomeRoute(),
      label: LocaleKeys.nav_bar_home),
  const CustomBottomBarItem(
      icon: Icons.library_books_outlined,
      activeIcon: Icons.library_books,
      route: ViewCoursesRoute(),
      label: LocaleKeys.nav_bar_courses),
  CustomBottomBarItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings_rounded,
      route: SettingsRoute(),
      label: LocaleKeys.nav_bar_settings),
];

class CustomNavigationWidget extends StatelessWidget {
  late final List<PageRouteInfo> _routes;

  late final List<CustomBottomBarItem> _items;

  CustomNavigationWidget({super.key}) {
    _items = navigationItems.filter((t) {
      if (t.route!.routeName == ViewCoursesRoute.name) {
        if (getIt<AuthCache>().user!.roles!.contains('student') ||
            getIt<AuthCache>().user!.roles!.contains('instructor')) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    }).toList();

    _routes = _items.map((e) => e.route!).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
        routes: _routes,
        inheritNavigatorObservers: true,
        builder: (context, child, controller) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
              bottomNavigationBar: CustomBottomBar(
                  items: _items,
                  currentIndex: tabsRouter.activeIndex,
                  onItemSelected: (item) {
                    tabsRouter.navigate(item.route!);
                  }),
              body: SafeArea(
                child: child,
              ));
        });
  }
}
