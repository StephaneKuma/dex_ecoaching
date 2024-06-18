// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_coaching/src/core/constants/colors.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
    this.color = kTertiaryColor,
  });

  factory CategoryList.primary() => const CategoryList(
        color: kPrimaryColor,
      );

  final Color color;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<String> categories = [
    'Tout',
    'Programming',
    'Design',
    'Marketing',
    'Business',
    'Photography',
    'Music',
    'Lifestyle',
    'Health',
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              current = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: current == index
                  ? widget.color
                  : widget.color.withOpacity(.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                  color: current == index ? Colors.white : kTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
