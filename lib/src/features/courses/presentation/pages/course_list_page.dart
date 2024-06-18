// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/core/constants/dimensions.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/category_list.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/course_box.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CourseListPage extends StatelessWidget {
  const CourseListPage({
    super.key,
    this.title = "Liste des cours",
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: <Widget>[
                const SearchBox(),
                SizedBox(height: kDefaultSizedBoxHeight.h),
                CategoryList.primary(),
                SizedBox(height: kDefaultSizedBoxHeight.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemBuilder: (context, index) => CourseBox.inRaw(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
