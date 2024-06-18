// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'index.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatPage(),
      );
    },
    CourseCategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CourseCategoriesPage(),
      );
    },
    CourseHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CourseHomePage(),
      );
    },
    CourseListRoute.name: (routeData) {
      final args = routeData.argsAs<CourseListRouteArgs>(
          orElse: () => const CourseListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseListPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    CoursesMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CoursesMainPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
    ProfilRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationPage(),
      );
    },
    SetupAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetupAccountPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    TransactionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionPage(),
      );
    },
    UserCoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserCoursesPage(),
      );
    },
  };
}

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CourseCategoriesPage]
class CourseCategoriesRoute extends PageRouteInfo<void> {
  const CourseCategoriesRoute({List<PageRouteInfo>? children})
      : super(
          CourseCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourseCategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CourseHomePage]
class CourseHomeRoute extends PageRouteInfo<void> {
  const CourseHomeRoute({List<PageRouteInfo>? children})
      : super(
          CourseHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourseHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CourseListPage]
class CourseListRoute extends PageRouteInfo<CourseListRouteArgs> {
  CourseListRoute({
    Key? key,
    String title = "Liste des cours",
    List<PageRouteInfo>? children,
  }) : super(
          CourseListRoute.name,
          args: CourseListRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseListRoute';

  static const PageInfo<CourseListRouteArgs> page =
      PageInfo<CourseListRouteArgs>(name);
}

class CourseListRouteArgs {
  const CourseListRouteArgs({
    this.key,
    this.title = "Liste des cours",
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'CourseListRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [CoursesMainPage]
class CoursesMainRoute extends PageRouteInfo<void> {
  const CoursesMainRoute({List<PageRouteInfo>? children})
      : super(
          CoursesMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoursesMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilPage]
class ProfilRoute extends PageRouteInfo<void> {
  const ProfilRoute({List<PageRouteInfo>? children})
      : super(
          ProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetupAccountPage]
class SetupAccountRoute extends PageRouteInfo<void> {
  const SetupAccountRoute({List<PageRouteInfo>? children})
      : super(
          SetupAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionPage]
class TransactionRoute extends PageRouteInfo<void> {
  const TransactionRoute({List<PageRouteInfo>? children})
      : super(
          TransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserCoursesPage]
class UserCoursesRoute extends PageRouteInfo<void> {
  const UserCoursesRoute({List<PageRouteInfo>? children})
      : super(
          UserCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserCoursesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
