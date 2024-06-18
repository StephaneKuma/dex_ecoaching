import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/core/constants/dimensions.dart';
import 'package:e_coaching/src/features/courses/presentation/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CourseCategoriesPage extends StatefulWidget {
  const CourseCategoriesPage({super.key});

  @override
  State<CourseCategoriesPage> createState() => _CourseCategoriesPageState();
}

class _CourseCategoriesPageState extends State<CourseCategoriesPage> {
  final List<String> categories = [
    "Conception 3D",
    "UI/UX Design",
    "Programmation",
    "Référencement",
    "Finance Digitale",
    "Développement Personnel",
    "Productivité",
    "Gestion de RH"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.allCategories),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: <Widget>[
                const SearchBox(),
                SizedBox(height: kDefaultSizedBoxHeight.h),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 20.sp,
                    crossAxisSpacing: 20.sp,
                  ),
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/categories/${index + 1}.png",
                        height: 50.h,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
