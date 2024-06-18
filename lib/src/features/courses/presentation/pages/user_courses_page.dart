import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_coaching/src/core/constants/dimensions.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/course_box.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/search_box.dart';

@RoutePage()
class UserCoursesPage extends StatefulWidget {
  const UserCoursesPage({super.key});

  @override
  State<UserCoursesPage> createState() => _UserCoursesPageState();
}

class _UserCoursesPageState extends State<UserCoursesPage> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: <Widget>[
              const SearchBox(),
              SizedBox(height: kDefaultSizedBoxHeight.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          current = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: current == 0
                              ? kPrimaryColor
                              : kPrimaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            'Complété',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color:
                                  current == 0 ? Colors.white : kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          current = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: current == 1
                              ? kPrimaryColor
                              : kPrimaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            'En cours',
                            style: TextStyle(
                              color:
                                  current == 1 ? Colors.white : kPrimaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: kDefaultSizedBoxHeight.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemBuilder: (context, index) =>
                    current == 1 ? CourseBox.inRaw() : CourseBox.completed(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
