import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/usecase/auth/load_auth_user_usecase.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_cubit.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_state.dart';
import 'package:main_platform/app/presentation/screens/auth/signup/signup_screen.dart';
import 'package:main_platform/app/presentation/screens/auth/signup/steps/student_info/fill_student_info_screen.dart';
import 'package:main_platform/app/presentation/screens/auth/signup/steps/verify_email/verify_email_screen.dart';
import 'package:main_platform/app/presentation/screens/auth/signup/steps/verify_identity/verify_identity_screen.dart';
import 'package:main_platform/app/presentation/screens/auth/step_required/step_required_screen.dart';
import 'package:main_platform/app/presentation/screens/course/add_course/add_course_screen.dart';
import 'package:main_platform/app/presentation/screens/chat_channel/chat_channel_screen.dart';
import 'package:main_platform/app/presentation/screens/course/view_course/course_screen.dart';
import 'package:main_platform/app/presentation/screens/auth/forbidden/forbidden_screen.dart';
import 'package:main_platform/app/presentation/screens/course/view_courses/view_courses_screen.dart';
import 'package:main_platform/app/presentation/screens/home/home_screen.dart';
import 'package:main_platform/app/presentation/screens/library/student_library/student_library_screen.dart';
import 'package:main_platform/app/presentation/screens/library/student_library/student_book_information.dart';
import 'package:main_platform/app/presentation/screens/auth/login/login_screen.dart';
import 'package:main_platform/app/presentation/screens/main/main_screen.dart';
import 'package:main_platform/app/presentation/screens/main/splash_screen.dart';
import 'package:main_platform/app/presentation/screens/prviacy_settings/privacy_settings_screen.dart';
import 'package:main_platform/app/presentation/screens/auth/session_expired/session_expired.dart';
import 'package:main_platform/app/presentation/screens/settings/settings_screen.dart';
import 'package:main_platform/core/constants/signup_step.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/guards/role_guard.dart';
import 'package:main_platform/app/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:main_platform/app/presentation/screens/profile/profile_view_screen.dart';

part 'router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
            page: ForbiddenRoute.page,
            fullscreenDialog: true,
            path: '/forbidden'),
        AutoRoute(path: '/', page: MainRoute.page, children: [
          AutoRoute(
            path: 'home',
            page: HomeRoute.page,
            title: (context, data) => "Home",
          ),
          AutoRoute(
              path: 'settings',
              page: SettingsRoute.page,
              title: (context, data) => "Settings"),
          AutoRoute(path: 'courses', page: ViewCoursesRoute.page),
        ]),
        AutoRoute(path: '/courses/:id', page: CourseRoute.page),
        AutoRoute(path: '/chat', page: ChatChannelRoute.page),
        AutoRoute(path: '/settings/privacy', page: PrivacySettingsRoute.page),
        AutoRoute(path: '/student-library', page: StudentLibraryRoute.page),
        AutoRoute(
            path: '/student-book-info', page: StudentRouteInformation.page),
        AutoRoute(
            path: '/course/add',
            page: AddCourseRoute.page,
            guards: const [
              RoleGuard(roles: {'professor': true})
            ]),

        AutoRoute(path: '/login', page: LoginRoute.page, keepHistory: false),
        AutoRoute(path: '/signup', page: SignUpRoute.page),
        AutoRoute(
          path: '/verify-email',
          page: VerifyEmailRoute.page,
        ),
        AutoRoute(
          path: '/verify-identity',
          page: VerifyIdentityRoute.page,
        ),
        AutoRoute(
          path: '/student-info',
          page: FillStudentInfoRoute.page,
        ),

        AutoRoute(
            path: '/session-expired',
            page: SessionExpiredRoute.page,
            keepHistory: false),
        AutoRoute(path: '/user/:id/profile', page: ProfileViewRoute.page),
        AutoRoute(path: '/edit-profile', page: EditProfileRoute.page),
        // AutoRoute(path: '/verify-email'),
      ];

  final _authCubit = getIt<AuthCubit>();
  final _loadUserUseCase = getIt<LoadAuthUserUseCase>();

  final List<String> _whitelist = [
    SplashRoute.name,
    LoginRoute.name,
    SignUpRoute.name,
  ];

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    var result = await _loadUserUseCase(NoParams());

    result.fold((error) {
      getIt<AuthCubit>().unauthenticated(error);
    }, (user) {
      getIt<AuthCubit>().authenticated(user);
    });

    if (_authCubit.status == AuthStatus.unknown &&
        _whitelist.contains(resolver.routeName)) {
      resolver.next();
    } else if (_authCubit.status == AuthStatus.expired) {
      _authCubit.unauthenticated(null);
      router.navigate(const SessionExpiredRoute());
    } else if (_authCubit.status == AuthStatus.unauthenticated) {
      if (_whitelist.contains(resolver.routeName)) {
        resolver.next();
      } else {
        router.navigate(const LoginRoute());
      }
    } else if (_authCubit.status == AuthStatus.authenticated) {
      var user = _authCubit.state.user!;
      var roles = user.roles!;
      var flags = user.flags!;
      var mapValues = {
        FillStudentInfoRoute.name:
            !roles.contains("student") || flags.isKnownStudent,
        // VerifyIdentityRoute.name: flags.isIdentityVerified,
        // VerifyEmailRoute.name: flags.isEmailVerified,
      };
      Map<String, PageRouteInfo> mapRoutes = {
        FillStudentInfoRoute.name: FillStudentInfoRoute(),
        // VerifyIdentityRoute.name: VerifyIdentityRoute(),
        // VerifyEmailRoute.name: const VerifyEmailRoute(),
      };

      if (_whitelist.contains(resolver.routeName)) {
        router.navigate(const MainRoute());
      } else {
        var name = resolver.routeName;
        if (mapValues.containsKey(name) && mapRoutes.containsKey(name)) {
          if (mapValues[name]!) {
            router.navigate(const MainRoute());
          } else {
            resolver.next();
          }
        } else {
          for (var entry in mapValues.entries) {
            if (!entry.value) {
              return router.navigate(mapRoutes[entry.key]!);
            }
          }
          resolver.next();
        }
      }
    }
  }
}
