import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/core/router/index.dart';
import 'package:e_coaching/src/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:e_coaching/src/core/constants/dimensions.dart';
import 'package:e_coaching/src/features/onboarding/presentation/widgets/onboarding_dot.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    List<String> titles = <String>[
      AppLocalizations.of(context)!.onBoardingTitle1,
      AppLocalizations.of(context)!.onBoardingTitle2,
      AppLocalizations.of(context)!.onBoardingTitle3,
    ];
    List<String> descriptions = <String>[
      AppLocalizations.of(context)!.onBoardingDescription1,
      AppLocalizations.of(context)!.onBoardingDescription2,
      AppLocalizations.of(context)!.onBoardingDescription3,
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: mediaQuery.padding.top.h),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: kPrimaryColor.withOpacity(0.2),
                    child: PageView.builder(
                      onPageChanged: (value) => setState(() {
                        currentIndex = value;
                      }),
                      itemCount: 3,
                      itemBuilder: (context, index) => Image.asset(
                        "assets/images/onboarding/${index + 1}.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0.w,
                vertical: 20.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                      (index) => OnboardingDot(
                        index: index,
                        currentIndex: currentIndex,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        titles[currentIndex],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sarabun(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          color: kTitleColor,
                        ),
                      ),
                      SizedBox(height: (kDefaultSizedBoxHeight * 2.5).h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.h),
                        child: Text(
                          descriptions[currentIndex],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sarabun(
                            // fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => context.router.push(const SignInRoute()),
                        child: Text(
                          AppLocalizations.of(context)!.alreadyHaveAccountSignIn,
                          style: GoogleFonts.sarabun(
                            // fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: kTitleColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Button(
                        onPressed: () =>
                            context.router.replace(const RegistrationRoute()),
                        label:
                            AppLocalizations.of(context)!.startWithOneMonthFree,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
