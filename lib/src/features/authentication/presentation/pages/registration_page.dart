import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';

import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:e_coaching/src/core/constants/dimensions.dart';
import 'package:e_coaching/src/core/router/index.dart';
import 'package:e_coaching/src/core/widgets/button.dart';
import 'package:e_coaching/src/core/widgets/custom_text_form_field.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool termsAndConditions = false;

  @override
  void initState() {
    emailNameController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    confirmPasswordController = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    emailNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.letUsGetStarted,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: kTitleColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              AppLocalizations.of(context)!.createAnAccountToAccessCourses,
              style: const TextStyle(
                // fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            SizedBox(height: (kDefaultSizedBoxHeight * 3).h),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const LineIcon.envelopeAlt(),
                    label: "Email",
                    controller: emailNameController,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const LineIcon.lock(),
                    label: AppLocalizations.of(context)!.password,
                    hasSuffix: true,
                    controller: passwordController,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const LineIcon.lock(),
                    label: AppLocalizations.of(context)!.confirmPassword,
                    hasSuffix: true,
                    controller: confirmPasswordController,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  CheckboxMenuButton(
                    value: termsAndConditions,
                    onChanged: (value) {
                      setState(() {
                        termsAndConditions = value!;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.acceptTerms),
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  Button(
                    onPressed: () {},
                    label: AppLocalizations.of(context)!.register,
                  ),
                  SizedBox(height: (kDefaultSizedBoxHeight * 2).h),
                  Text(
                    AppLocalizations.of(context)!.orContinueWith,
                    style: const TextStyle(
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * .4).w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(25.r),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5.r,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(25.r),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5.r,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.apple,
                                size: 35.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: (kDefaultSizedBoxHeight * 2).h),
                  GestureDetector(
                    onTap: () => context.router.push(const SignInRoute()),
                    child: RichText(
                      text: TextSpan(
                        text:
                            "${AppLocalizations.of(context)!.alreadyHaveAccount} ",
                        style: const TextStyle(color: kTextColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: AppLocalizations.of(context)!.signIn,
                            style: const TextStyle(
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}