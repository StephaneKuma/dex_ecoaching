import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';

import 'package:e_coaching/src/core/constants/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 1.r,
            blurRadius: 12.r,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: LineIcon.search(
                  size: 30.h,
                ),
              ),
              SizedBox(width: 10.w),
              Text(AppLocalizations.of(context)!.search),
            ],
          ),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: const LineIcon.tools(),
          )
        ],
      ),
    );
  }
}
