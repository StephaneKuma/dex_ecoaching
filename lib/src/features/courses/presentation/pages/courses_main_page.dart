import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/core/router/index.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

@RoutePage()
class CoursesMainPage extends StatelessWidget {
  const CoursesMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo<dynamic>>[
        CourseHomeRoute(),
        UserCoursesRoute(),
      ],
      builder: (context, child) {
        final TabsRouter router = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: router.activeIndex,
            onDestinationSelected: router.setActiveIndex,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: LineIcon.home(),
                label: 'Home',
              ),
              NavigationDestination(
                icon: LineIcon.list(),
                label: 'My Courses',
              ),
            ],
          ),
        );
      },
    );
  }
}
