// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddCourseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddCourseScreen(),
      );
    },
    ChatChannelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatChannelScreen(),
      );
    },
    CourseRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseRouteArgs>(
          orElse: () => CourseRouteArgs(courseId: pathParams.optString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseScreen(
          key: args.key,
          courseId: args.courseId,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    FillStudentInfoRoute.name: (routeData) {
      final args = routeData.argsAs<FillStudentInfoRouteArgs>(
          orElse: () => const FillStudentInfoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FillStudentInfoScreen(key: args.key),
      );
    },
    ForbiddenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForbiddenScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    PrivacySettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacySettingsScreen(),
      );
    },
    ProfileViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileViewRouteArgs>(
          orElse: () =>
              ProfileViewRouteArgs(userId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileViewScreen(
          args.userId,
          key: args.key,
        ),
      );
    },
    SessionExpiredRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SessionExpiredScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StepRequiredRoute.name: (routeData) {
      final args = routeData.argsAs<StepRequiredRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StepRequiredScreen(
          key: args.key,
          step: args.step,
        ),
      );
    },
    StudentLibraryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentLibraryScreen(),
      );
    },
    StudentRouteInformation.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentPageInformation(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyEmailScreen(),
      );
    },
    VerifyIdentityRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyIdentityRouteArgs>(
          orElse: () => const VerifyIdentityRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyIdentityScreen(key: args.key),
      );
    },
    ViewCoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ViewCoursesScreen(),
      );
    },
  };
}

/// generated route for
/// [AddCourseScreen]
class AddCourseRoute extends PageRouteInfo<void> {
  const AddCourseRoute({List<PageRouteInfo>? children})
      : super(
          AddCourseRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCourseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatChannelScreen]
class ChatChannelRoute extends PageRouteInfo<void> {
  const ChatChannelRoute({List<PageRouteInfo>? children})
      : super(
          ChatChannelRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatChannelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CourseScreen]
class CourseRoute extends PageRouteInfo<CourseRouteArgs> {
  CourseRoute({
    Key? key,
    String? courseId,
    List<PageRouteInfo>? children,
  }) : super(
          CourseRoute.name,
          args: CourseRouteArgs(
            key: key,
            courseId: courseId,
          ),
          rawPathParams: {'id': courseId},
          initialChildren: children,
        );

  static const String name = 'CourseRoute';

  static const PageInfo<CourseRouteArgs> page = PageInfo<CourseRouteArgs>(name);
}

class CourseRouteArgs {
  const CourseRouteArgs({
    this.key,
    this.courseId,
  });

  final Key? key;

  final String? courseId;

  @override
  String toString() {
    return 'CourseRouteArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FillStudentInfoScreen]
class FillStudentInfoRoute extends PageRouteInfo<FillStudentInfoRouteArgs> {
  FillStudentInfoRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FillStudentInfoRoute.name,
          args: FillStudentInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FillStudentInfoRoute';

  static const PageInfo<FillStudentInfoRouteArgs> page =
      PageInfo<FillStudentInfoRouteArgs>(name);
}

class FillStudentInfoRouteArgs {
  const FillStudentInfoRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FillStudentInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ForbiddenScreen]
class ForbiddenRoute extends PageRouteInfo<void> {
  const ForbiddenRoute({List<PageRouteInfo>? children})
      : super(
          ForbiddenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForbiddenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacySettingsScreen]
class PrivacySettingsRoute extends PageRouteInfo<void> {
  const PrivacySettingsRoute({List<PageRouteInfo>? children})
      : super(
          PrivacySettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacySettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileViewScreen]
class ProfileViewRoute extends PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({
    required String userId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileViewRoute.name,
          args: ProfileViewRouteArgs(
            userId: userId,
            key: key,
          ),
          rawPathParams: {'id': userId},
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

  static const PageInfo<ProfileViewRouteArgs> page =
      PageInfo<ProfileViewRouteArgs>(name);
}

class ProfileViewRouteArgs {
  const ProfileViewRouteArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final Key? key;

  @override
  String toString() {
    return 'ProfileViewRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [SessionExpiredScreen]
class SessionExpiredRoute extends PageRouteInfo<void> {
  const SessionExpiredRoute({List<PageRouteInfo>? children})
      : super(
          SessionExpiredRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionExpiredRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StepRequiredScreen]
class StepRequiredRoute extends PageRouteInfo<StepRequiredRouteArgs> {
  StepRequiredRoute({
    Key? key,
    required SignUpStep step,
    List<PageRouteInfo>? children,
  }) : super(
          StepRequiredRoute.name,
          args: StepRequiredRouteArgs(
            key: key,
            step: step,
          ),
          initialChildren: children,
        );

  static const String name = 'StepRequiredRoute';

  static const PageInfo<StepRequiredRouteArgs> page =
      PageInfo<StepRequiredRouteArgs>(name);
}

class StepRequiredRouteArgs {
  const StepRequiredRouteArgs({
    this.key,
    required this.step,
  });

  final Key? key;

  final SignUpStep step;

  @override
  String toString() {
    return 'StepRequiredRouteArgs{key: $key, step: $step}';
  }
}

/// generated route for
/// [StudentLibraryScreen]
class StudentLibraryRoute extends PageRouteInfo<void> {
  const StudentLibraryRoute({List<PageRouteInfo>? children})
      : super(
          StudentLibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentLibraryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentPageInformation]
class StudentRouteInformation extends PageRouteInfo<void> {
  const StudentRouteInformation({List<PageRouteInfo>? children})
      : super(
          StudentRouteInformation.name,
          initialChildren: children,
        );

  static const String name = 'StudentRouteInformation';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyEmailScreen]
class VerifyEmailRoute extends PageRouteInfo<void> {
  const VerifyEmailRoute({List<PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyIdentityScreen]
class VerifyIdentityRoute extends PageRouteInfo<VerifyIdentityRouteArgs> {
  VerifyIdentityRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyIdentityRoute.name,
          args: VerifyIdentityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'VerifyIdentityRoute';

  static const PageInfo<VerifyIdentityRouteArgs> page =
      PageInfo<VerifyIdentityRouteArgs>(name);
}

class VerifyIdentityRouteArgs {
  const VerifyIdentityRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'VerifyIdentityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ViewCoursesScreen]
class ViewCoursesRoute extends PageRouteInfo<void> {
  const ViewCoursesRoute({List<PageRouteInfo>? children})
      : super(
          ViewCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewCoursesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
