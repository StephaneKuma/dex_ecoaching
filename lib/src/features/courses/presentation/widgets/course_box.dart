// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseBox extends StatelessWidget {
  const CourseBox({
    super.key,
    this.inRow = false,
    this.inProgress = false,
    this.completed = false,
  });

  factory CourseBox.inRaw() => const CourseBox(
        inRow: true,
      );

  factory CourseBox.completed({
    required bool inProgress,
    required bool completed,
  }) {
    return CourseBox(
      inRow: true,
      inProgress: inProgress,
      completed: completed,
    );
  }

  final bool inRow;
  final bool inProgress;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final containerHeight = size.height * (inRow ? 0.25 : .3);

    return Container(
      height: containerHeight.h,
      width: (size.width * 0.9).w,
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: containerHeight.h),
        child: IntrinsicHeight(
          child: inRow == true
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  "UI/UX Design",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (completed && !inProgress)
                                  Container(
                                    height: 50.h,
                                    width: 50.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: kTertiaryColor,
                                      size: 45.sp,
                                    ),
                                  ),
                                if (!completed && inProgress)
                                  const FaIcon(
                                    FontAwesomeIcons.spinner,
                                    color: kTertiaryColor,
                                  )
                                else if (!completed && !inProgress)
                                  const Icon(
                                    Icons.bookmark,
                                    color: kTertiaryColor,
                                  )
                              ],
                            ),
                            Text(
                              "UX Writing",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (!completed && !inProgress)
                              RichText(
                                text: TextSpan(
                                  text: "28 \$  ",
                                  style: TextStyle(
                                    color: kTertiaryColor,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "42 \$",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 20.sp,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: kPrimaryColor,
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 5.w),
                                    const Text(
                                      "4.2",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "|",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (!completed && !inProgress)
                                  Text(
                                    "28 mentors",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (completed || inProgress)
                                  const Text(
                                    "2 h 36 mins",
                                    style: TextStyle(
                                      // fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                            if (completed)
                              TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Cerificat'),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Afficher le certificat'.toUpperCase(),
                                  style: const TextStyle(
                                    color: kTertiaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: kTertiaryColor,
                                  ),
                                ),
                              ),
                            if (inProgress)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue.shade50,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 9,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: kTertiaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12.r,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  const Text(
                                    "93/100",
                                    style: TextStyle(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "UI/UX Design",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.bookmark,
                                  color: kTertiaryColor,
                                )
                              ],
                            ),
                            Text(
                              "UX Writing",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: kPrimaryColor,
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 5.w),
                                    const Text(
                                      "4.2",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "28 mentors",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
