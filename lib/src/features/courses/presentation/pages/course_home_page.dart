import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_coaching/src/core/router/index.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/category_list.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/course_box.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/header_box.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/offer_box.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/search_box.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/welcome_box.dart';

@RoutePage()
class CourseHomePage extends StatelessWidget {
  const CourseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: (mediaQuery.padding.top + 20).h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: <Widget>[
                  const WelcomeBox(),
                  SizedBox(height: (20).h),
                  SearchBox.withFilter(),
                ],
              ),
            ),
            SizedBox(height: (20).h),
            const OfferBox(),
            SizedBox(height: (20).h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: <Widget>[
                  HeaderBox(
                    title: AppLocalizations.of(context)!.categories,
                    onTap: () => context.router.push(
                      const CourseCategoriesRoute(),
                    ),
                  ),
                  SizedBox(height: (10).h),
                  const CategoryList(),
                  SizedBox(height: (10).h),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    height: (MediaQuery.of(context).size.height * 0.35).h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const CourseBox(),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 20.w),
                      itemCount: 5,
                    ),
                  ),
                  SizedBox(height: (20).h),
                  HeaderBox(
                    title: AppLocalizations.of(context)!.popularCourses,
                    onTap: () => context.router.push(
                      CourseListRoute(
                        title: AppLocalizations.of(context)!.popularCourses,
                      ),
                    ),
                  ),
                  SizedBox(height: (10).h),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    height: (MediaQuery.of(context).size.height * 0.35).h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const CourseBox(),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 16.w),
                      itemCount: 5,
                    ),
                  ),
                  SizedBox(height: (20).h),
                  HeaderBox(
                    title: AppLocalizations.of(context)!.topMentors,
                    onTap: () {},
                  ),
                  SizedBox(height: (20).h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
