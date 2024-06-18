// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBox extends StatelessWidget {
  const HeaderBox({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            AppLocalizations.of(context)!.viewAll.toUpperCase(),
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
