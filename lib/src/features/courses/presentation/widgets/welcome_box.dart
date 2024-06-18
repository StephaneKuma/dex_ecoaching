import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';

import 'package:e_coaching/src/core/constants/colors.dart';

class WelcomeBox extends StatelessWidget {
  const WelcomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${AppLocalizations.of(context)!.goodMorning}, Ronald A. Martin",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(AppLocalizations.of(context)!.whatToLearnToday),
          ],
        ),
        Container(
          height: 60.h,
          width: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.r),
            border: Border.all(
              color: kTertiaryColor,
              width: 3.w,
            ),
          ),
          child: Center(
            child: LineIcon.bellAlt(
              color: kTertiaryColor,
              size: 40.h,
            ),
          ),
        ),
      ],
    );
  }
}
