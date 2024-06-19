import 'package:auto_route/auto_route.dart';
import 'package:e_coaching/src/core/locator/index.dart';
import 'package:e_coaching/src/core/services/validador.dart';
import 'package:e_coaching/src/core/widgets/loader.dart';
import 'package:e_coaching/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailNameController;
  late TextEditingController passwordController;

  bool rememberMe = false;

  @override
  void initState() {
    emailNameController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    emailNameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              context.router.replace(const SetupAccountRoute());
            }

            if (state is AuthenticationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return const Loader();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.logIn,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: kTitleColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context)!.logInYourAccount,
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
                        label: AppLocalizations.of(context)!.email,
                        controller: emailNameController,
                        validator: (value) {
                          return locator<Validador>().email(
                            value: value,
                            context: context,
                          );
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

                          // return locator<Validador>().password(
                          //   value: value,
                          //   context: context,
                          // );
                        },
                      ),
                      SizedBox(height: kDefaultSizedBoxHeight.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CheckboxMenuButton(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.rememberMe,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.forgotPassword,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: kDefaultSizedBoxHeight.h),
                      Button(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(
                                  AuthenticationSignedIn(
                                    email: emailNameController.text.trim(),
                                    password: passwordController.text,
                                  ),
                                );
                          }
                        },
                        label: AppLocalizations.of(context)!.signIn,
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
                        onTap: () =>
                            context.router.replace(const RegistrationRoute()),
                        child: RichText(
                          text: TextSpan(
                            text:
                                "${AppLocalizations.of(context)!.doesntHaveAccount} ",
                            style: const TextStyle(color: kTextColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: AppLocalizations.of(context)!.register,
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
            );
          },
        ),
      ),
    );
  }
}
