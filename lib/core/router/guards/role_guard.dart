import 'package:auto_route/auto_route.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';

class RoleGuard extends AutoRouteGuard {
  final Map<String, bool?> roles;

  const RoleGuard({required this.roles});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    var user = getIt<AuthCache>().user;
    if (user != null && user.roles != null) {
      for (var entry in roles.entries) {
        if (entry.value == true && user.roles!.contains(entry.key)) {
          return resolver.next();
        } else if (entry.value == false && user.roles!.contains(entry.key)) {
          router.navigate(const ForbiddenRoute());
          return;
        }
      }
      router.navigate(const ForbiddenRoute());
      return;
    } else {
      router.navigate(const LoginRoute());
    }
  }
}
