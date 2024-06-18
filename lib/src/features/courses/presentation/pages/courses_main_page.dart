import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:e_coaching/src/core/router/index.dart';

@RoutePage()
class CoursesMainPage extends StatelessWidget {
  const CoursesMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsRouter(
        routes: const <PageRouteInfo<dynamic>>[
          CourseHomeRoute(),
          UserCoursesRoute(),
          ChatRoute(),
          TransactionRoute(),
          ProfilRoute(),
        ],
        builder: (context, child) {
          final TabsRouter router = AutoTabsRouter.of(context);

          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: router.activeIndex,
              onDestinationSelected: router.setActiveIndex,
              destinations: <NavigationDestination>[
                NavigationDestination(
                  icon: const FaIcon(FontAwesomeIcons.house),
                  label: AppLocalizations.of(context)!.home,
                ),
                NavigationDestination(
                  icon: const FaIcon(FontAwesomeIcons.listCheck),
                  label: AppLocalizations.of(context)!.myCourses,
                ),
                NavigationDestination(
                  icon: const FaIcon(FontAwesomeIcons.message),
                  label: AppLocalizations.of(context)!.chat,
                ),
                NavigationDestination(
                  icon: const FaIcon(FontAwesomeIcons.wallet),
                  label: AppLocalizations.of(context)!.transaction,
                ),
                NavigationDestination(
                  icon: const FaIcon(FontAwesomeIcons.user),
                  label: AppLocalizations.of(context)!.profile,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
