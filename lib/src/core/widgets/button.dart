// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_coaching/src/core/constants/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onPressed,
    required this.label,
    this.submiting = false,
  });

  final void Function()? onPressed;
  final String label;
  final bool submiting;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(60.h),
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: submiting
          ? const CircularProgressIndicator(
              color: kSecondaryColor,
            )
          : Text(label),
    );
  }
}
