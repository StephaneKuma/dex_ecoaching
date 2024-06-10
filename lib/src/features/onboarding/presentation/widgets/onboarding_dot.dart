// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingDot extends StatelessWidget {
  const OnboardingDot({
    super.key,
    required this.index,
    required this.currentIndex,
  });

  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      height: 5.h,
      width: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: index == currentIndex ? kTitleColor : Colors.grey[300],
      ),
    );
  }
}
