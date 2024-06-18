import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/features/authentication/presentation/pages/index.dart';
import 'package:e_coaching/src/features/chat/presentation/pages/index.dart';
import 'package:e_coaching/src/features/courses/presentation/pages/index.dart';
import 'package:e_coaching/src/features/onboarding/presentation/pages/index.dart';
import 'package:e_coaching/src/features/profile/presentation/pages/index.dart';
import 'package:e_coaching/src/features/transaction/presentation/pages/index.dart';
import 'package:flutter/material.dart';

part 'index.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        CustomRoute(
          page: OnboardingRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: SignInRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: RegistrationRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: SetupAccountRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: CoursesMainRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
          children: <AutoRoute>[
            CustomRoute(
              page: CourseHomeRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            CustomRoute(
              page: UserCoursesRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            CustomRoute(
              page: ChatRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            CustomRoute(
              page: TransactionRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            CustomRoute(
              page: ProfilRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
          ],
        ),
        CustomRoute(
          page: CourseCategoriesRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: CourseListRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
        ),
      ];
}
